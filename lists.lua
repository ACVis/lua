-- linked lists

list = nil

-- insert an element at the beginning
list = {next = list, value = v}

-- traverse list
local l = list
while l do 
   print(l.value)
   l = l.next
end
