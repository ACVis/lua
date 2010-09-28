-- when a function enclosed in another function has full access to local variables from the enclosing
-- function, this is known as lexical scoping.

-- a closure is a first class function with lexical scoping (access to local variables of the enclosing function
-- a higher order function is a function that accepts a function as an argument

names = { "peter", "paul", "mary" }
print(unpack(names))
grades = { mary = 10, paul = 7, peter = 8 }
table.sort(names, function (n1, n2)
		     return grades[n1] > grades[n2]
		  end)
print(unpack(names))

-- now using a function
function sortbygrade (names, grades)
   table.sort(names, function(n1, n2)
			return grades[n1] > grades[n2]
		     end)
end

function newCounter()
   local i = 0
   return function ()
	     i = i + 1
	     return i
	  end
end

c1 = newCounter()
print(c1()) --> 1
print(c1()) --> 2

c2 = newCounter()
print(c2())
print(c1())
print(c2())

-- callbacks

function digitButton (digit)
   return Button{label = digit, action = function ()
					    add_to_display(digit)
					 end
	      }
end

-- redefining functions
oldSin = math.sin
math.sin = function (x)
	      return oldSing(x*math.pi/180)
	   end

-- a cleaner way to do it
do 
   local oldSin = math.sin
   local k = math.pi/180
   math.sin = function (x)
		 return oldSin(x*k)
	      end
end

-- a sandbox can be created by using a do block

do
   local oldOpen = io.open
   io.open = function (filename, mode)
		if access_OK(filename, mode) then
		   return oldOpen(filename, mode)
		else
		   return nil, "access denied"
		end
	     end
end
