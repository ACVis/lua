-- compilation, execution and errors

-- lua is an interpreted language, but precompiles source code to an intermediate form before running
-- the compiler is part of the runtime, much like perl

-- dofile runs chunks of code loaded from a file.
-- loadfile also loads chunks from files but does not run them, it instead compiles the chunk and 
-- returns it as a function.

-- loadfile does not raise errors, instead it returns error codes

-- dofile function can be defined as follows
function dofile(filename)
   local f = assert(loadfile(filename))
   return f()
end

-- assert is used to raise an error if loadfile fails

-- loadfile is more flexible than dofile, incase of errors loadfile returns nil plus the error message.
-- if a file is run several times loadfile can be called just once and the result used multiple times. 
-- this is cheaper than several calls to dofile since the program is only compiled once.

-- loadstring is similar to loadfile except it reads chunks from a string

f = loadstring("i = i + 1")

-- f will invoke the function i = i + 1 

i = 0
f(); print(i)
f(); print(i)

-- loadstring is powerful but expensive

-- "a = 1" is returned as
function () a = 1 end

-- chunks can declare local vars and return vals
f = loadstring("local a = 10; return a + 20")
print(f())

-- loadstring and loadfile dont raise errors, instead they return nil and an error message
print(loadstring("i i")) --> nil  [string "i i"]:1: '=' expected near 'i'

-- loadfile and loadstring do not define functions. Function definitions are assignments, they are made at runtime 
-- not compile time.

-- there is a file foo.lua
function foo(x)
   print(x)
end

-- run command
f = loadfile("foo.lua")

-- foo is compiled but not defined, to define it, the chunk must be run

f() -- defines foo
foo("ok")

-- quick and dirty dostring to load and run a chunk, call result from loadstring

loadstring(s)()

-- if theres an error, loadstring will return nil, use asserts for better error messages
assert(loadstring(s))()

-- this 
f = loadstring("i = i + 1")
-- is equivalent to
f = function () i = i + 1 end
-- the second is faster because its only compiled once when the chunk is compiled. In the first
-- each call to loadstring involes a new compilation. loadstring does not compile with 
-- lexical scoping

local i = 0
f = loadstring("i = i + 1")
g = function () i = i + 1 end

-- the g function manipulates the local i, where as f manipulates gloabal i, because loadstring always
-- compiles the strings in a global environment

-- loadstring is typically used to run external code, a piece of code outside of the program. 
-- for instance plotting a function defined by a user, user enters the function code and loadstring
-- is used to evaluate it. loadstring expects a chunk, statements. If an expression is to be evaluated
-- it must be prefixed with return. 

print "enter your expression:"
local l = io.read()
local func = assert(loadstring("return " .. 1))
print("the value of your expression is " .. func())

-- function returned by loadstring is a regular function so can be used multiple times
print "enter function to plot with variable x:"
local l = io.read()
local f = assert(loadstring("return " .. l))
for i=1,20 do
   x = i -- global x
   print(string.rep("*", f()))
end