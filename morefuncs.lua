-- functions are first class values meaning a function can be a value stored in globals and locals. 
-- They can be passed as args and returned by other funs.

-- functions have lexical scoping, meaning they can access variables of their enclosing functions.
-- functions dont have a name, for instance print is a variable holding a function 

a = { p = print }
a.p("Hello World") --> Hello World
--[[
print = math.sin -- print now refers to a sine function
a.p(print(1))    -- 0.84blabla
sin = a.p        -- sin now refers to the print function that refers to math.sin
sin(10, 20)      -- 10   20
]]
-- functions can be declared in the following manor
function foo (x) return 2*x end
--OR
foo = function (x) return 2*x end

-- table.sort is a function that receives a table and sorts the elements. It has to be able to sort in
-- an infinite number of ways. So sort provides an optional parameter, the order function.
-- the order function receives two elements and returns whether the first must come before the second.

-- table of records
network = {
   {name = "grauna",  IP = "210.26.30.34"},
   {name = "arraial", IP = "210.26.30.23"},
   {name = "lua",     IP = "210.26.23.12"},
   {name = "derain",  IP = "210.26.23.20"},
}

-- sorting the table by field "name" in reverse
table.sort (network, function (a,b) return (a.name > b.name) end)

-- a function that takes another function as an argument is whats known as a higher order function

function eraseTerminal()
   io.write("\27[2J")
end

-- writes an '*' at column x, row y
function mark(x,y)
   io.write(string.format("\27[%d;%dH*", y, x))
end

-- Term size
TermSize = { w = 80, h =24 }

-- plot function
function plot (f)
   eraseTerminal()
   for i=1,TermSize.w do
      local x = (i/TermSize.w)*2 - 1
      local y = (f(x) + 1)/2 * TermSize.h
      mark(i, y)
   end
   io.read()
end

plot (function (x) return math.sin(x*2*math.pi) end)

