IO.puts (cond do
  2 + 2 == 5 ->
    "won't match"
  2 * 2 == 3 ->
    "won't match"
  1 + 1 == 2 ->
    "but this will"
end)

IO.puts (cond do
  2 + 2 == 5 ->
    "won't match"
  2 * 2 == 3 ->
    "won't match"
  #1 + 1 == 2 ->
  #  "but this will"
  true ->
    "match"
end)

IO.puts(
  cond do
    hd([1,2,3]) ->
      "1"
  end
)
