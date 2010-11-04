-- arrays

-- arrays in lua are implemented by indexing tables with integers. Arrays have no fixed size.

a = {} 
for i=1,1000 do
   a[i] = 0
end

-- array can start at any value

b = {}
for i=-5,5 do
   b[i] = 0
end

-- initialise array in single expression, upto a few million elements

squares = { 1, 4, 9, 16 }