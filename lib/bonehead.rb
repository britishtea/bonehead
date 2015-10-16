# Public: Executes a block of code and retries it up to `tries` times if an
# exception was raised.
#
# tries      - An Integer (default: Float::Infinity).
# exceptions - A list of Exceptions (default: StandardError).
#
# Examples
# 
#   class Wrapper
#     include Bonehead
#     
#     def login(username, password)
#       insist(5, HTTPError) do
#         HTTP.post "..."
#       end
#     end
#   end 
#
# Returns the return value of the block.
module Bonehead
  extend self

  def insist(tries = Float::Infinity, *exceptions, &block)
    exceptions << StandardError if exceptions.empty?

    catch :__BONEHEAD__ do
      tries.times do |i|
        begin
          throw :__BONEHEAD__, yield(i.succ)
        rescue *exceptions
          tries.pred == i ? raise : next
        end
      end
    end
  end
end
