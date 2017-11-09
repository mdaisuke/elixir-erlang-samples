defmodule ErlangLibraries do
  def log(item), do: IO.puts(inspect(item))

  def run do
    log(~w(erlang libraries))

    log(String.to_charlist("Ø"))
    log(:binary.bin_to_list("Ø"))
    :io.format("pi is almost ~10.3f~n", [:math.pi])
    log(to_string :io_lib.format("pi is almost ~10.3f~n", [:math.pi]))
    log(Base.encode16(:crypto.hash(:sha256, "Elixir")))
    log(:crypto.hash(:sha256, "Elixir"))

    #digraph = :digprah.new()
    #coords = [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
    #[v0, v1, v2] = (for c <- coords, do: :digraph.add_vertex(digraph, c))

    #table = :ets.new(:ets_test, [])
    #:ets.insert(table, {"China", 10000})
    #:ets.insert(table, {"India", 11000})
    #:ets.insert(table, {"USA", 1000})
    #:ets.i(table)
  end
end

ErlangLibraries.run
