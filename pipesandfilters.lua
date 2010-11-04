-- pipes and filters

-- producer and consumer

function producer ()
   while true do
      local x = io.read()  -- produce new value
      send(x) -- send new value
   end
end

function consumer ()
   while true do 
      local x = receieve()  -- receive from producer
      io.write(x, "\n")  -- consume new value
   end
end

-- in this example both producer and consumer run forever. the problem is how to match send and receive.
-- both run their own main loops and assume the other is callable.

-- coroutines are an ideal way to match producer and consumer because resume-yield reverses the typical caller callee roles.
-- When a coroutine yields it does not enter into a new function. It returns a pending call to resume. A call to resume 
-- does not start a new function but returns a call to yield. 

function receive ()
   local status, value = coroutine.resume(producer)
   return value
end

function send(x)
   coroutine.yield(x)
end

-- producer must now be a coroutine

producer = coroutine.create(
   function ()
      while true do
	 local x = io.read()
	 send(x)
      end
   end)

