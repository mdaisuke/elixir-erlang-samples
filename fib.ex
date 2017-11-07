defmodule Fib do
  def calc(n) when n == 0 or n == 1, do: n
  def calc(n) when is_integer(n), do: calc(n-1) + calc(n-2)
end
