defmodule MyMath do
  def sum_list([head | tail], acc) do
    sum_list(tail, head + acc)
  end
  def sum_list([], acc) do
    acc
  end

  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end
  def double_each([]), do: []
end

IO.puts MyMath.sum_list([1,2,3], 0)
