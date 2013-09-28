require_relative "../lib/insist"

prepare { $i = 0 }
setup { Insist }

test "retries when an exception was raised" do |mod|
  mod.insist(3) do
    $i = $i + 1
    raise "an exception" if $i == 1
  end

  assert_equal $i, 2
end

test "does not retry when no exception was raised" do |mod|
  mod.insist(3) { $i = $i + 1 }

  assert_equal $i, 1
end

test "raises an exception when the last try fails" do |mod|
  assert_raise(StandardError) do
    mod.insist(3) do
      $i = $i + 1
      raise "an exception"
    end
  end

  assert_equal $i, 3
end

test "returns the return value of the passed block" do |mod|
  assert_equal mod.insist(3) { "test" }, "test"
end

CustomError = Class.new StandardError

test "retries only when a given exception was raised" do |mod|
  assert_raise(StandardError) do
    mod.insist(3, CustomError) do
      $i = $i + 1
      raise StandardError, "an exception"
    end
  end

  assert_equal $i, 1
end

test "doesn't retry when a non-given exception was raised" do |mod|
  assert_raise(CustomError) do
    mod.insist(3, CustomError) do
      $i = $i + 1
      raise CustomError, "an exception"
    end
  end

  assert_equal $i, 3
end
