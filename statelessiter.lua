-- stateless iterators

-- stateless iterator maintains no stae so it can be used in multiple loops and avoids the cost of creating new closures.
-- remember, a closure is a first class function that has access to the variables of its enclosing function

-- On each iteration, the for loop calls its iterator function with two arguments: the invariant state and the control variable.

a =  { "one", "twp", "three" }
for i, v in ipairs(a) do
   print(i,v)
end

-- the state of the iteration is the table, also known as the invariant state which does not change during the loop, plus 
-- the current index which is the control variable. 

-- ipairs and the iterator can be written in lua, wtf does that even mean
function iter (a, i)
   i = i + 1
   local v = a[i]
   if v then
      return i,v
   end
end

function ipairs (a)
   return iter, a , 0
end

-- calling ipairs(a) in a for loop returns three values; the iter function, a as the invariant state, and zero as the control variable.
-- lua calls iter(a,0) which results in 1, then iter(a,1) that results in 2 and so on until a[i] is nil

-- pairs is similar to ipairs except that the iter function is the next function, next is a primitive function

function pairs (t)
   return next, t, nil
end

-- next(t, k), where k is key and t is table, returns a next key in the table and the value.
-- next(t, nil) returns a first pair

-- next can be called without pairs
for k, v in next, t do
   ...
end