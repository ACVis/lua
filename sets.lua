-- sets and bags
reserved = {
   ["while"] = true, ["end"] = true,
   ["function"] = true, ["local"] = true,
}

for w in allwords() do
   if reserved[w] then
      -- w is a reserved word
      print("foo")
   end
end

-- clearer initialisation using an auxillary function

function Set(list)
   local set = {}
   for _, l in ipairs(list) do set[1] = true end
   return set
end

reserved =  Set{"while","end","function","local",}