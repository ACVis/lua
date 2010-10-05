-- require function

-- require is a higher level function to load and run libraries.
-- it differs from dofile in two ways; it searches in the file path and
-- controls whether a file has already been run

-- the path used by require is a list of patterns, each one of them
-- specifying an alternative way to transform a virtual file name into 
-- a real filename. each component in the path is a filename 
-- containing optional interrogation marks. the ? is replaced by the
-- filename required.

--[[
?;?.lua;c:\windows\?;/usr/local/lua/?/?.lua

translates to:

lili
lili.lua
c:\windows\lili
/usr/local/lua/lili/lili.lua
]]

-- require first checks the global variable LUA_PATH, if its a string then 
-- its a path other require checks the environment variable LUA_PATH. If 
-- all else fails lua checks a fixed path "?;?.lua".

-- require stores the virtual named of the loaded files in a table.
-- the table can be accessed via the global variable _LOADED.
-- a file can be loaded twice by tricking require. say require 'foo' is used,
-- _LOADED["foo"] will not be nil, assigning nil to it then requiring 
-- the file again wil run the file

-- before require runs a chunk it defines a global variable _REQUIREDNAME 
-- containing the virtual name of the file being required.