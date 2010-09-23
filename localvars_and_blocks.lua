j = 10		-- global
local i = 1 	--local

-- local variables scope is limited to the block in which they are declared
-- a block is the body of a control structure, the body of a function, or a chunk
-- chunk (file or string)

x = 10
local i = 1	-- local to chunk

while i<=x do
  local x = i*2
  print(x)
  i = i + 1
end

if i > 20 then
  local x	-- local to the then body
  x = 20
  print(x + 2)
else
  print(x)	-- 10 the global var
end
print(x)	-- global

-- access to local vars is faster than global, use of global vars should be avoided so as not to clutter the
-- global environment

-- do end block for finer control of local vars
a = 1
c = 3
b = 4
do
  local a2 = 2*a
  local d = sqrt(b^2 - 4*a*c)
  x1 = (-b + d)/a2
  x2 = (-b - d)/a2
end
print(x1,x2)