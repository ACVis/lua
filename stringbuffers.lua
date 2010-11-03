-- string buffers

-- typical bad read file
local buff = ""
for line in io.lines() do
   buff = buff ..line .. "\n"
end

-- that will be costly for large files, use io.read instead

io.read("*all")

-- towers of hanoi string reading
function newStack()
   return {""}
end

function addString(stack, s)
   table.insert(stack, s)
   for i=table.getn(stack)-1, 1, -1 do
      if strin.len(stack[i]) > string.len(stack[i+1]) then
	 break
      end
      stack[i] = stack[i] .. table.remove(stack)
   end
end

-- final contents of the buffer are concatenated using table.concat

local s = newStack()
for line in io.lines() do
   addString(s, line .. "\n")
end
s = toString(s)

-- io.read will still be faster, infact io.read uses the same data structure but in C

local t = {}
for line in io.lines() do
   table.insert(t, line)
end
s = table.concat(t, "\n") .. "\n"

