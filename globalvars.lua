-- It is not an error to access a non-initialized variable; 
-- you just get the special value nil as the result
print(b) --> nil
b = 10
print(b) --> 10


-- Usually you do not need to delete global variables; 
-- if your variable is going to have a short life, you should use a local variable. 
-- But, if you need to delete a global variable, just assign nil to it:
b = nil
print(b) --> nil

-- declaring a global variable as nil declares it nonexistant
