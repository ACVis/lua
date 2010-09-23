-- Constructors are expressions that create and initialize tables.

a = {} -- constructor initializes empty table

days = {"Sunday", "Monday", "Tuesday", "Wednesday",
       "Thursday", "Friday", "Saturday"}
print(days[4]) --> Wednesday

a = {x=0, y=0} 
-- equivalent to
a = {}; a.x = 0; a.y = 0

-- can add and remove fields of any type. this part is cool.
w = {x=0, y=0, label="console"} -- initialize table w
x = {sin(0), sin(1), sin(2)} -- initialize table x with funcs as vals
w[1] = "another field" 	-- add an entry to 1, does not overwrite w["x"]
x.f = w 		-- x["f"] is now another table? wha?!
print(w["x"])   --> 0
print(w[1])     --> another field
print(x.f[1])   --> another field
w.x = nil       -- remove field "x"

-- Every time Lua evaluates a constructor, it creates and initializes a new table. Consequently, we can use tables to implement linked lists:
list = nil -- delete list if exists
for line in io.lines() do -- for line in stdin lines 
  list = {next=list, value=line} -- create linked list
end
--Each node in the list is a table with two fields: value, with the line contents, and next, with a reference to the next node.

--print list contents
l = list
while l do
  print(l.value)
  l = l.next
end
