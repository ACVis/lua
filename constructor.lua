-- Constructors are expressions that create and initialize tables.

a = {} -- constructor initializes empty table

days = {"Sunday", "Monday", "Tuesday", "Wednesday",
       "Thursday", "Friday", "Saturday"}
print(days[4]) --> Wednesday

a = {x=0, y=0} 
-- equivalent to
a = {}; a.x = 0; a.y = 0

-- can add and remove fields of any type. this part is cool.
--[[ w = {x=0, y=0, label="console"} -- initialize table w
x = {sin(0), sin(1), sin(2)} -- initialize table x with funcs as vals
w[1] = "another field" 	-- add an entry to 1, does not overwrite w["x"]
x.f = w 		-- x["f"] is now another table? wha?!
print(w["x"])   --> 0
print(w[1])     --> another field
print(x.f[1])   --> another field
w.x = nil       -- remove field "x"
]]
-- Every time Lua evaluates a constructor, it creates and initializes a new table. Consequently, we can use tables to implement linked lists:
list = nil -- delete list if exists
--[[ for line in io.lines() do -- for line in stdin lines 
  list = {next=list, value=line} -- create linked list
end

--Each node in the list is a table with two fields: value, with the line contents, and next, with a reference to the next node.

--print list contents
l = list
while l do
  print(l.value)
  l = l.next
end
]]

-- record style and list style intialization in same constructor
-- it is also a representation of nested constructors, each element is a table representing a record
polyline = {color="blue", thickness=2, npoints=4,
	 {x=0, y=0},
	 {x=-10, y=0},
	 {x=-10, y=1},
	 {x=0, y=1}
}

print(polyline[2].x)
print(polyline[1].x)

-- ok this goes over my head
opnames = {["+"] = "add", ["-"] = "sub",
           ["*"] = "mul", ["/"] = "div"}
    
i = 20; s = "-"
a = {[i+0] = s, [i+1] = s..s, [i+2] = s..s..s}
   
print(opnames[s])    --> sub
print(a[22])         --> ---


-- {x=0, y=0} is equivalent to {["x"]=0, ["y"]=0}
-- {"red", "green", "blue"} is equivalent to {[1]="red", [2]="green", [3]="blue"}

-- starting an array at 0, commas can trail the last value, semi colons can be used instead of commas

days = { [0]="Sunday"; "Monday", "Tuesday", }
print(days[1])