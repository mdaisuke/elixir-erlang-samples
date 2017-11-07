IO.puts (case {1,2,3} do
  {4,5,6} ->
    "this clause won't match"
  {1,x,3} ->
    "this clause will match and bind x to #{x} in this clause"
  _ ->
    "this clause would match any value"
end)

x = 1

IO.puts (case 10 do
  ^x -> "won't match"
  _ -> "will match"
end)

IO.puts (case {1,2,3} do
  {1, x, 3} when x > 0 ->
    "will match"
  _ ->
    "won't match"
end)

IO.puts (case 1 do
  x when hd(x) -> "won't match"
  x -> "got #{x}"
end)

#case :ok do
#  :error -> "won't match"
#end
