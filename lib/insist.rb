module Insist
  extend self

  # Public: Executes a block of code and retries it up to `tries` times if an
  # exception was raised.
  #
  # tries      - An Integer (default: Float::Infinity).
  # exceptions - A list of Exceptions (uses StandardError if no Exceptions are 
  #              given).
  #
  # Returns the return value of the block.
  def insist(tries = Float::Infinity, *exceptions, &block)
    exceptions << StandardError if exceptions.empty?

    catch :__INSIST__ do
      tries.times do |i|
        begin
          throw :__INSIST__, yield(i)
        rescue *exceptions
          tries.pred == i ? raise : next
        end
      end
    end
  end
end