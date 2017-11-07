#35..40
#|> Enum.each(fn i -> 
#  IO.puts Fib.calc(i)
#end)
# 14.23 real        14.05 user         0.19 sys

defmodule Hoge do
  def run do
    parent = self()
    35..40
    |> Enum.each(fn i -> 
      spawn do
        send parent, i
      end
    end)

    loop([])
  end

  def loop(results) when length(results) >= 6, do: exit(0)
  def loop(results) when is_list(results) do
    receive do
      x -> 
        [x | results]
    end
    IO.puts hd(results)
    loop(results)
  end
end

Hoge.run
