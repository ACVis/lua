-- tail calls
-- a tail call is a goto that looks like a call, its when a function calls another function as  its last action

function f(x)
   return g(x)
end

-- a tail call means we do not need to return to the calling function so lua takes advantage by not using any
-- extra stack space, no idea what that even means but its and implementation of proper tail calls.

-- because proper tail calls use no stack space theres no limit on nested tail calls.
-- soooooo the following will not overflow

function foo(n)
   if n > 0 then return foo(n-1) end
end

-- NOT a tail call
function f(x)
   g(x)
   return
end
-- it fails because f must disregard the results of g before returning

-- these also fail
--[[
return g(x) + 1     -- must do the addition
return x or g(x)    -- must adjust to 1 result
return (g(x))       -- must adjust to 1 result
]]
-- tail call format: return g(...)

-- this is a tail call
--return x[i].foo(x[j] + a*b, i +j)

-- proper tail calls in lua are used for programming state machines
-- each state can be represented by a function, changing state is done by going to a function (tail call)

-- small maze game, each room represents a state, lets move room to room
function room1()
   local move = io.read()
   if move == "south" then return room3()
   elseif move == "east" then return room2()
   else print("invalid move")
      return room1() -- stay in room
   end
end

function room2()
   local move = io.read()
   if move == "south" then return room4()
   elseif move == "west" then return room1()
   else print("invalid move")
      return room2()
   end
end

function room3 ()
   local move = io.read()
   if move == "north" then return room1()
   elseif move == "east" then return room4()
   else print("invalid move")
      return room3()
   end
end
    
function room4 ()
   print("congratulations!")
end

-- start the game by calling room1 wooooooooooo

room1()