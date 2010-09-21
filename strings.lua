-- Strings have the usual meaning: a sequence of characters. 
-- Lua is eight-bit clean and so strings may contain characters with any numeric value, 
-- including embedded zeros. That means that you can store any binary data into a string. 
-- Strings in Lua are immutable values.
a = "this is a string"
b = string.gsub(a, "this", "foo") -- substitutions
print(a)
print(b)

--[[ strings can be delimited by matching double square brackets.
 Literals in this bracketed form may run for several lines, may nest, 
 and do not interpret escape sequences. Moreover, this form ignores the 
 first character of the string when this character is a newline. This 
 form is especially convenient for writing strings that contain program pieces;
]]
page = [[
<HTML>
<HEAD>
<TITLE>An HTML Page</TITLE>
</HEAD>
<BODY>
<A HREF="http://www.lua.org">Lua</A>
</BODY>
</HTML>
]]

print(page)


-- Lua provides automatic conversions between numbers and strings at run time. 
-- Any numeric operation applied to a string tries to convert the string to a number:

print("10" + 1)           --> 11
print("10 + 1")           --> 10 + 1
print("-5.3e-10"*"2")     --> -1.06e-09
-- print("hello" + 1)        -- ERROR (cannot convert "hello")

-- it appears lua will treat numbers as strings where string functions are executed
print(10 .. 20)
