-- The table type implements associative arrays. An associative array is an array that can be 
-- indexed not only with numbers, but also with strings or any other value of the language, except nil

-- Tables have no fixed size, tables are objects

-- Tables are the main (in fact, the only) data structuring mechanism in Lua, and a powerful one.

--[[
 you do not have to declare a table in Lua; in fact, there is no way to declare one. 
 You create tables by means of a constructor expression, which in its simplest form 
 is written as {}
]]

a = {} 		-- create new table, store reference in a
k = "x" 	-- some crap
a[k] = 10	-- new entry, key is "X" and value 10
a[20] = "wooo" 	-- key 20, value "wooo"
print(a["x"])	--> 10
k = 20
print(a[k])	--> "wooo"
a["x"] = a["x"] + 1 -- increment by 1

-- thats interesting stuff

a = {} 
b = a	-- b references same table as a woot
a["x"] = 10
print(b["x"]) --> 10, thats right
a = nil -- b still references table
b = nil -- no references to table

-- lua mem management will eventually delete the table when no refs exist

t = {} 
-- create entries
for i=1,1000 do t[i] = i*10 end
print(t[9]) --> 90
print(t["foo"]) --> nil, much like global vars

-- like global variables, you can assign nil to a table field to delete it. 
-- That is not a coincidence: Lua stores global variables in ordinary tables.

t.x = 10 -- is the same as t["x"] = 10
print(t.y) -- same as print(t["y"])

-- conventional array can be created with integer keys

-- read 10 lines from cli into array
a = {}
print("enter 10 lines of text")
for i=1,10 do
  a[i] = io.read()
end

-- lua provides a function called ipairs to iterate over a conventional array. nil element represents the end
