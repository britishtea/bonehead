# Insist

Retry blocks of code when they raise an exception.

## What is it?

```ruby
def insist(tries = Float::Infinity, *exceptions, &block)
```

Insist lets you execute a block of code. If no exception was raised it returns
the return value of the block. If an exception was raised, it executes the block
again. If after `tries` times the block still raises an exception, the exception
is re-raised.

## Usage

Retry on *all* `StandardError`s.

```ruby
begin
  Insist.insist 3 do
    API.make_request_that_may_fail
  end
rescue
  puts "Even after three tries we failed!" 
end
```

Retry only on *certain* exceptions (`GoogleError` and `SocketError` in this 
case).

```ruby
begin
  Insist.insist 3, GoogleError, SocketError do
    Google.make_request_that_may_fail
  end
rescue GoogleError, SocketError
  puts "Even after three times we failed!"
end
```

Note that `Insist` can be included too.

## Installation

`gem install insist`

## License

See the LICENSE file.