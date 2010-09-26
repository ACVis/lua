-- named arguments 
-- parameter passing in lua is positional, the first argument gives value to the first parameter

-- parameters can be passed by name by passing a table as one argument

function rename (arg)
   return os.rename(arg.old, arg.new)
end

-- example: rename{old="temp.lua", new="temp1.lua"}

-- the following function expects certain named options to be mandatory
function Window (options)
   -- check mandatory options
   if type(options.title) ~= "string" then
      error("no title")
   elseif type(options.width) ~= "number" then
      error("no width")
   elseif type(options.height) ~= "number" then
      error("no height")
   end
   
   -- everything else is optional
   _Window(options.title,
	   options.x or 0,    -- default value
	   options.y or 0,    -- default value
	   options.width, options.height,
	   options.background or "white",   -- default
	   options.border      -- default is false (nil)
	)
end
