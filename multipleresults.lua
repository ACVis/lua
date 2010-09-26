-- returning multiple results

-- lua providers a function called string.find to locate patterns in a string. The return result
-- is two indices, start of the match and the end of the match.

s, e = string.find("hello lua users", "lua")
print(s, e) --> 7	9

-- functions can also return multiple results

function max (a)
  local mi = 1
  local m = a[mi]
  for i,val in ipairs(a) do
    if val > m then
      mi = i
      m = val
    end
  end
  return m, mi
end
print(max({8,10,23,12,4})) --> 23 3

function foo0() end
function foo1() return 'a' end
function foo2() return 'a','b' end

-- multiple assignment from a function call
x,y = foo2() -- x='a', y='b'
x = foo2()   -- x='a', 'b' is discarded
x,y,z = 10,foo2()  -- x=10, y='a', z='b'

-- if there are not enough return results lua returns nil
x,y = foo0() -- x=nil, y=nil
x,y = foo1()  -- x='a', y=nil
x,y,z = foo2()  -- x='a', y='b', z=nil

-- a function call that is not the last in the elements only returns one result
x,y = foo2(), 20 -- x='a', y=20
x,y = foo0(), 20, 30  -- x='nil', y=20, 30 is discarded

-- function as the last or only call to another function

print(foo0())          -->
print(foo1())          -->  a
print(foo2())          -->  a   b
print(foo2(), 1)       -->  a   1
print(foo2() .. "x")   -->  ax

-- constructor can collect any number of arguments from a call
a = {foo0()}         -- a = {}  (an empty table)
a = {foo1()}         -- a = {'a'}
a = {foo2()}         -- a = {'a', 'b'}

-- it only works if the call is the last in the list
a = {foo0(), foo2(), 4} -- a[1] = nil, a[2] = 'a', a[3] = 4

function foo (i)
   if i == 0 then return foo0()
   elseif i == 1 then return foo1()
   elseif i == 2 then return foo2()
   end
end
    
print(foo(1))     --> a
print(foo(2))     --> a  b
print(foo(0))     -- (no results)
print(foo(3))     -- (no results)

-- force only 1 result returned by wrapping in double parenthesis
print((foo0()))        --> nil
print((foo1()))        --> a
print((foo2()))        --> a

-- unpack is a special function that returns all results, makes no sense tome
f = string.find
a = {"hello", "ll"}
print("I am here")
f(unpack(a))

-- the predefined unpack function is written in C but could be done in lua using recursion

function unpack (t, i)
   i = i or 1
   if t[i] ~= nil then
      return t[i], unpack(t, i + 1)
   end
end