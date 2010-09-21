-- There are eight basic types in Lua: nil, boolean, number, string, userdata, function, thread, and table. The type function gives the type name of a given value:
print(type("Hello world"))  --> string
print(type(10.4*3))         --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string
-- The last example will result in "string" no matter the value of X, because the result of type is always a string.

