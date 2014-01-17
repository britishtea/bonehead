# Bonehead

Retry blocks of code when they raise an exception.

## What is it?

```ruby
def insist(tries = Float::Infinity, *exceptions, &block)
```

Bonehead lets you execute a block of code. If no exception was raised it returns
the return value of the block. If an exception was raised, it executes the block
again. If after `tries` times the block still raises an exception, the exception
is re-raised.

## Usage

```ruby
class Example
  include Bonehead

  # Retry on all* exceptions. All means any exception inheriting from 
  # StandardError, just like rescue.

  def all_exceptions
    insist 3 do
      raise "Fail!"
    end
  rescue
    puts "Rescued the exception after 3 tries."
  end

  # Retry only on certain exceptions (any exception other than TypeError won't)
  # trigger a retry).

  def some_exceptions
  	insist 3, TypeError do
      raise TypeError, "Fail!"
  	end
  rescue
	  puts "Even after three tries we failed!" 
  end

  # Sometimes you want to wait a little before retrying.

  def wait_for_it
    insist 3 do |try|
      sleep 0.1 if try > 1

      raise "Fail!"
    end
  end
end
```

`Bonehead` doesn't have to be included, `Bonehead.insist(3) { "hello" }` is 
valid too.

## Installation

`gem install bonehead`

## License

See the LICENSE file.