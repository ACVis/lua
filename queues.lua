-- queues

-- using insert or remove on large structures is slow, a faster method is using indices

function ListNew ()
   return {first = 0, last = -1}
end

-- redefine the above as a table so as not to polute the global space
List = {}
function List.new()
   return {first = 0, last = -1}
end

-- elements can now be removed in constant time
function List.pushleft (list, value)
   local first = list.first - 1
   list.first = first
   list[first] = value
end

function List.pushright (list, value)
   local last = list.last + 1
   list.last = last
   list[last] = value
end

function List.popleft (list)
   local first = list.first
   if first > list.last then error("list is empty") end
   local value = list[first]
   list[first] = nil -- garbage collect, sweet
   list.first = first + 1
   return value
end

function List.popright(list)
   local last = list.last
   if list.first > last then error("list is empty") end
   local value = list[last]
   list[last] = nil
   list.last = last -1
   return value
end
