--[[ numeric for
for var=exp1,exp2,exp3 do
  something
end
]]

-- for i=1,f(x) do print(i) end

for i=10,1,-1 do print(i) end

-- if the control variable is needed it must be saved, it is local to the loop
value = 4
a = { 1, 2, 3, 4, 7, n=5 }
local found = nil
for i=1,a.n do
  if a[i] == value then
    found = i -- save the value of i
    break
  end
end
print(found)