print(8*9, 9/8) -- function as a statement

a = math.sin(3) + math.cos(10) -- function as an expression
print(os.date())

-- function arguments must be in parenthesis unless it is a single string literal or table constructor
--[[
print "hello world" <--> print("hello world")
dofile 'a.lua'	    <--> dofile('a.lua')
print [[a multiline <--> print([[a multiline
message ]]	    	 message ]]
f{x=20, y=30}	    <--> f({x=20,y=30})
type{}		    <--> type({})
]]

-- lua offers special syntax for OO calls, a colon operator. o:foo(x) is the same as o.foo(o,x).
-- Thats a call to o.foo with o as the first extra arg.

-- conventional lua function syntax

-- add all elements to array a
function add(a)
  local sum = 0
  for i,v in ipairs(a) do
    sum = sum + v
  end
  return sum
end

-- param assignments behave the same as multiple assignments

function f(a, b) return a or b end
--[[
CALL	      PARAMS
f(3)	      a=3,b=nil
f(3,4)	      a=3,b=4
f(3,4,5)      a=3,b=4 (5 is discarded)
]]

function incCount(n)
  n = n or 1 -- first initializes n as nil
  count = count + n
end
