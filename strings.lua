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
