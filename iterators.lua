-- an interator is any construction that allows you to iterate over a collection
-- iterators are represented by functions in lua, each time the function is called 
-- it returns the next element from the collection

-- an iterator needs to maintain state between calls so it knows how to proceed
-- closures provide a mechanism for doing so. 

-- a closure is a function that can access local variables from within a enclosing function

-- variables are kept across successive calls to the closure, allowing the closure to remember
-- where it is. a closure involves two functions, the closure itself and the factory, the 
-- function that creates the closure

-- iterate a list

function list_iter(t)
   local i = 0
   local n = table.getn(t)
   return function ()
	     i = i + 1
	     if i <= n then return t[i] end
	  end
end

-- list_iter is the factory, each time its called it creates a new closure, the closure keeps
-- its state in the extern vars (t, i, and n).

-- usage

t = { 10, 20, 30 }
iter = list_iter(t) -- create the iterator

while true do 
   local element = iter() -- call the iterator
   if element == nil then break end
   print(element)
end

-- easier to use for
t = { 10, 20, 30 }
for element in list_iter(t) do
   print(element)
end

-- an iterator to travers all words in current input
function allwords ()
   local line = io.read() -- current line 
   local post = 1 -- current pos on line
   return function () -- iterator func
	     while line do
		local s, e = string.find(line, "%w+", pos)
		if s then  -- found word?
		   pos = e + 1  -- nex pos is after word
		   return string.sub(line, s, e ) -- return word
		else
		   line = io.read() -- not found, next line
		   pos = 1
		end
	     end
	     return nil
	  end
end

-- using the allwords func

for word in allwords() do 
   print (word)
end
