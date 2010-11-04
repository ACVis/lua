-- coroutines

--[[ 
A coroutine is similar to a thread, a line of execution with its own stack, local cars and its own instruction pointers.
It however shares global cars and mostly everything else with coroutines.
The difference between threads and coroutines is that threads run concurrently while coroutines are collaborative. 
A program with coroutines will run one coroutine at any given time and only suspends it when it requests to be suspended.
]]

-- coroutine basics
--[[
coroutine functions are in the coroutine table. 

Create a function that creates a new coroutine accepts a single argument. A function with code that the coroutine will run.
It returns a value of type thread which represents the new coroutine. Usually create is treated as an anonymous function.
									 ]]

co = coroutine.create(function ()
			 print("hi")
		      end)
print(co)

--[[
A coroutine can be in one of three different states; suspended, running and dead. When a coroutine is started its in the
suspended state. So the coroutine does not run when its created. The state of a coroutine can be checked with the function
status.
]]

print(coroutine.status(co))

-- coroutine.resume starts or restarts the execution of the coroutine, changing the state form suspended to running
coroutine.resume(co)

-- the power of a coroutine is in yield which suspends a running coroutine

co = coroutine.create(function () 
			 for i=1,10, do
			    print("co", i)
			    coroutine.yield()
			 end
		      end)

-- now on resume it runs 1
coroutine.resume(co)  --> co 1

-- it is now suspended
print(coroutine.status(co))  --> suspended

-- once hte coroutine is done with execution its in a dead state so another call to resume will return an error
print(coroutine.resume(co))
--> false cannot resume dead coroutine

-- arguments can be passed to the coroutine

co = coroutine.create(function (a,b,c)
			 print("co", a,b,c)
		      end)
coroutine.resume(co, 1,2,3)

-- arguments can also be passed to yield and on resume it will execute

co = coroutine.create(function (a,b)
			 coroutine.yield(a + b, a - b)
		      end)
print(coroutine.resume(co, 20, 10)) --> true 30 10

-- yield can also return extra args sent to resume

co = coroutine.create (function ()
			  print("co", coroutine.yield())
		       end)
coroutine.resume(co)
coroutine.resume(co, 4, 5) --> co 4 5

-- any return values from the main function go to the resume
co = coroutine.create(function()
			 return 6, 7
		      end)
print(coroutine.resume(co)) -- true 6 7 

-- coroutines in lua are regarded as assymetric, one can call a symmetric coroutine by calling yield followed by resume.