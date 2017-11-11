defmodule HelloModule do
  def some_fun do
    IO.puts "Hello world!"
  end

  def some_fun(list) when is_list(list) do
    IO.inspect list
  end

  defp priv do
    :secret_info
  end
end
