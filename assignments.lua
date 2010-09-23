-- assignment
a = "hello" .. "world"
t = {n=1}
t.n = t.n + 1

-- multiple assignments
x = 1
a, b = 10, 2*x

-- lua only executes assignments after evaluation, so swapping is possible
--[[
x, y = y, x
a[i], a[j] = a[j], a[i]
]]

-- if a value does not match a var a nil assignment is executed
a, b, c = 0, 1 
print(a,b,c)		--> 0, 1, nil
a, b = a+1, b+1, b+2 	--> b+2 is ignored
print(a,b)
a,b,c = 0
print(a,b,c)		--> 0 nil nil

-- collecting return values from function

function f()
  return 1, 2
end

a, b = f()
print(a,b)