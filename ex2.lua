function prefix (w1, w2)
   return w1 .. ' ' .. w2
end

local statetab

function insert (index,value)
   if not statetab[index] then
      statetab[index] = {value}
   else
      table.insert(statetab[index], value)
   end
end

function allwords ()
   local line = io.read()
   local pos = 1
   return function ()
	     while line do
		local s, e = string.find(line, "%w+", pos)
		if s then
		   pos = e + 1
		   return string.sub(line, s, e)
		else
		   line = io.read()
		   pos = 1
		end
	     end
	     return nil
	  end
end

local N = 2
local MAXGEN =  10000
local NOWORD = "\n"

statetab = {}
local w1, w1 = NOWORD, NOWORD
for w in allwords() do
   insert(prefix(w1,w2), w)
   w1 = w2; w2 = w
end
insert(prefix(w1, w2), NOWORD)

w1 = NOWORD; w2 = NOWORD
for i=1,MAXGEN do
   local list = statetab[prefix(w1,w2)]
   local r = math.random(table.getn(list))
   local nextword = list(r)
   if nextword == NOWORD then return end
   io.write(nextword, " ")
   w1 = w2; w2 = nextword
end