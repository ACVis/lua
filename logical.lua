-- and returns first argument if its false else second
print(4 and 5) --> 5
print(nil and 14) --> nil
print(false and 14) --> false

-- or returns its first argument if not false else second
print(false or 2) --> 2
print(1 or false) --> 1

x = 1
v = 2
-- if x is not set or false then x = v
if not x then x = v end

-- max of two numbers
x = 1
y = 2
max = (x > y) and x or y

-- not always returns true or false
print(not nil) --> true
print(not false) --> true
print(not 0) --> false
print(not not nil) --> false