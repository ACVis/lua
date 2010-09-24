--[[ For syntactic reasons, a break or return can appear only as the last statement of a block 
(in other words, as the last statement in your chunk or just before an end, an else, or an until)
]]

v = 3
a = { 1, 2, 3, 4 }
local i = 1
while a[i] do
  if a[i] == v then print(a[i]); break end
  i = i + 1
end

--[[
    function foo ()
      return          --<< SYNTAX ERROR
      -- `return' is the last statement in the next block
      do return end   -- OK
      ...             -- statements not reached
    end
]]