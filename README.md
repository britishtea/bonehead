# Bonehead

Retry blocks of code when they raise an exception.

## What is it?

```ruby
def insist(tries = Float::Infinity, *exceptions, &block)
```

Bonehead executes a block. If an exception is raised in the block, it retries
executing it. After `tries` failed tries, the exception is re-raised.

## Usage

Retry on all exceptions inheriting from StandardError, just like rescue.

```ruby
Bonehead.insist 3 do
  raise "Fail!"
end
```

Retry on specific exceptions only, just like rescue. The block below is 3 times.

```ruby
Bonehead.insist 3, TypeError do
  raise TypeError, "Fail!"
end
```

And the one below only once.

```ruby
Bonehead.insist 3, TypeError do
  raise "Fail!"
end
```

It's easy to wait a while between retries.

```ruby
Bonehead.insist 3 do |try|
  sleep 0.1 if try > 1

  raise "Fail!"
end
```

## Installation

`gem install bonehead`

## Tests

Tests use [cutest][cutest]. Install Bonehead with development dependencies 
(`gem install cutest --development`) and run `make test`.

The tests can be run with the following command: `cutest test/*_test.rb`.

[cutest]: https://github.com/djanowski/cutest

## License

See the LICENSE file.