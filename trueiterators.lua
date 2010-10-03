-- true iterators

-- the iterator is actually the for loop, and our iterators basically provide the successive values for iteration

-- there is another way to do iterators. calling an iterator with an argument that tells it what to do at each
-- iteration. the iterator receives a function as the argument which it calls inside the loop

function allwords (f)
   -- repeat each line in file
   for l in io.lines() do
      -- repease each word in line
      for w in string.gfind(l, "%w+") do
	 -- call function
	 f(w)
      end
   end
end

-- to use the iterator supply it the loop body as a function
allwords(print)

-- using an anonymous function as the body
local count = 0 
allwords(function (w)
	    if w == "hello" then count = count + 1 end
	 end)
print(count)


local count = 0
for w in allwords() do
   if w == "hello" then count = count + 1 end
end
print(count)

