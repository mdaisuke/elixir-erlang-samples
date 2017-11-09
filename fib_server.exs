defmodule Fib do
  def calc(0), do: 0
  def calc(1), do: 1
  def calc(n) when is_integer(n), do: calc(n-1) + calc(n-2)
end

defmodule Fib.Client do
  def run do
    35..40
    |> Enum.map(fn i -> Task.async(Fib, :calc, [i]) end)
    |> Enum.each(fn task -> IO.puts(Task.await(task)) end)
  end
end

Fib.Client.run
