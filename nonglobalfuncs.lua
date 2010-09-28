-- non global functions
-- functions can be stored in global variables, local variables and table fields. awesome!
-- Most lua libraries are stored in table fields e.g. io.read, math.sin

Lib = {}
Lib.foo = function (x,y) return x + y end
Lib.goo = function (x,y) return x - y end

-- using constructors 

Lib = {
   foo = function (x,y) return x + y end,
   goo = function (x,y) return x - y end
}

-- or another definition

Lib = {}
function foo(x,y)
   return x + y
end

function goo(x,y)
   return x - y
end

-- a function stored in a local variable is a local function, its restricted to a given scope.
-- this means the function would only be visible within a chunk (file or do end block)

-- lexical scoping ensures other functions in the package can use these local functions
local f = function (...)
	     ...
	  end

local g = function (...)
	     ...
	     f()  -- extern local f is visible here
	     ...
	  end

-- syntactic sugar

local function f (...)
   ...
end

-- a recursive function will not work the naive approach since the function will not be defined yet
-- example
local fact = function (n)
		if n == 0 then return 1
		else return n*fact(n-1) -- ugh!
		end
	     end

-- to solve this, define the local func first
local fact
fact = function (n)
	  if n == 0 then return 1
	  else return n*fact(n-1)
	  end
       end

-- also

local function fact (n)
   if n == 0 then return 1
   else return n*fact(n-1)
   end
end

-- will not work with indirect recursive functions so use explicit forward declarations
local f,g
function g()
   f()
end

function f()
   g()
end
