-- iterators with complex state

-- sometimes more state needs to fit in a single invariant state and control variable. A simple solution is closures.
-- An alternative is to use a table as the invariant state. 

-- iter allwords, with state in a table, two fields, line and pos.

local iterator

function allwords ()
   local state = { line = io.read(), pos = 1 }
   return iterator, state
end

-- iterator

function iterator (state)
   while state.line do  -- repeat while lines
      -- search for next word
      local s, e = string.find(state.line, "%w+", state.pos)
      if s then
	 -- update next post
      state.pos = e + 1
	 return string.sub(state.line, s, e)
      else
	 state.line = io.read()
	 state.pos = 1
      end
   end
   return nil
end

-- wherever possible use stateless iterators so that state is kept inside the for variables. If they dont fit in that model 
-- then use closures.
-- A closure is more efficient than an iterator using tables. 

-- Closures are cheaper than tables
-- Upvalues are faster to access than table fields