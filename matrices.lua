-- matrices and multi dimensional arrays

-- a matrix of zeros with dimension n by m

mt = {}
for i=1,N do
   mt[i] = {}
   for j=1,M do
      mt[i][j] = 0
   end
end

-- tables are objects in lua so each row must be created explicitly to create the matrix

--[[
a triangular matrix can be created by changing for j=1,M do to for j=1,i do saving half the memory
]]

-- can also create a matrix by combining indices

at = {}
for i=1,N do
   for j=1,M do
      at[i*M + j] = 0
   end
end
