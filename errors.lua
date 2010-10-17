--[[
print "enter a number:"
n = io.read("*number")
if not n then error("invalid input") end
]]

-- assert can be used in place

--[[
print "enter a number:"
n = assert(io.read("*number"), "invalid input")
]]

-- assert checks the first value and returns it, if its true. If its false or nil assert returns an error message
-- the second argument to assert is the message which is optional.
-- lua evaluates the args before calling the functions so "foo " .. n .. " zool " will return foonzool
-- example
n = io.read()
assert(tonumber(n), "invalid input: " .. n .. " is not a number")


