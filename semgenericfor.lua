-- semantics of generic for
-- creating a loop for every closure is a task.
-- the generic for for a iterator holds the iterator, invariant state and control variable.

--[[
syntax
for <var-list> in <exp-list> do
  <body>
end
]]

-- var list is a list of one or more variable names, exp list is a list of one or more expressions

for k,v in pairs(t) do
   print(k,v)
end

-- list of vars k,v, expression pairs(t), sometimes there is only one var

for line in io.lines() do
   io.write(line, '\n')
end
   
-- first var in list is controlv var. Its value is never nil in loop otherwise loop ends

--[[

for var_1, ..., var_n in explist do block end

is the same as

do
   local _f, _s, _var = explist
   while true do
      local var_1, ..., var_n = _f(_s, _var)
      _var = var_1
      if _var == nil then break end
      block
   end
end
