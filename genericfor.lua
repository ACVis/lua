-- generic for

a = { a=1, b=2, c=3, d=4, e=5, f=6 }
-- print all the keys of a table
for k in pairs(a) do print(k) end

b = { 1, 2, 3, "5" }
--print values of an array
for i,v in ipairs(b) do print(v) end

-- table
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
-- reverse of the table
revDays = {["Sunday"] = 1, ["Monday"] = 2, ["Tuesday"] = 3, ["Wednesday"] = 4, ["Thursday"] = 5, ["Friday"] = 6, ["Saturday"] = 7}
x = "Tuesday"
print(revDays[x])

-- building the reverse table
revD = {}
for i,v in ipairs(days) do 
  revD[v] = i
end