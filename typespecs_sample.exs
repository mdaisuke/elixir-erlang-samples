defmodule TypespecsSample do
  @typedoc """
  Just a number followed by a string
  """
  #@typep atom_with_string :: {atom, String.t}
  @type atom_with_string :: {atom, String.t}

  def run do
    log("typespecs")
    log(get_tuple("hoge"))
  end

  @spec log(any) :: atom
  def log(item), do: IO.puts(inspect(item))

  @spec get_tuple(String.t) :: atom_with_string
  def get_tuple(str) do
    {:ok, str}
  end
end

defmodule QuietCalculator do
  @spec hoge(number) :: TypespecsSample.atom_with_string
  def hoge(num) do
    {:ok, "hoge #{num}"}
  end
end

defmodule Parser do
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}
  @callback extensions() :: [String.t]

  def parse!(implementation, contents) do
    case implementation.parse(contents) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "parsing error: #{error}"
    end
  end
end

defmodule JSONParser do
  @behaviour Parser

  def parse(str), do: {:ok, str}
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser

  def parse(str), do: {:ok, str}
  def extensions, do: ["yml"]
end

TypespecsSample.run
