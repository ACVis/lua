-- this is a factorial function yay

function factorial (n)
  if n == 0 then
    return 1
  else
    return n * factorial(n-1)
  end
end

print("enter a number:")
-- read the number
a = io.read("*number")
print(factorial(a))
