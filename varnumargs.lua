-- redefining print to store input into global var
printResult = ""
--[[
function print(...)
   for i,v in ipairs(arg) do
      printResult = printResult .. tostring(v) .. "\t"
   end
   printResult = printResult .. "\n"
end

print("foo bar zool man foo yes", "bla bla", "sys voo")
]]
--- three dots represents a variable number of arguments. All args are collected in a table.

-- dummy variables can be used if we dont want the first return result
s = "foo bar foo"
p = "oo"
local _, x = string.find(s, p)
print (x)

-- alternatively you can use select to choose the return value
print(string.find("hello hello", " hel"))         --> 6  9
print(select(1, string.find("hello hello", " hel"))) --> 6
print(select(2, string.find("hello hello", " hel"))) --> 9

-- accepting fixed args plus variable like select
function g (a, b, ...)
   print (a,b,unpack(arg))
end

g(1, 2, 2, 3, 4)

g(3)	-- a=3, b=nil, arg={n=0}
g(3, 4)      --    a=3, b=4, arg={n=0}
g(3, 4, 5, 8) --   a=3, b=4, arg={5, 8; n=2}

-- what select actually is

function select(...)
  return arg[n]
end

-- formatting text with string.format and writing with io.write
function fwrite(fmt, ...)
  return io.write(string.format(fmt, unpack(arg)))
end
