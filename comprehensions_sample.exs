defmodule ComprehensionsSample do
  defmodule Triple do
    def pythagorean(n) when n > 0 do
      for a <- 1..n,
        b <- 1..n,
        c <- 1..n,
        a + b + c <= n,
        a*a + b*b == c*c,
        do: {a, b, c}
    end
  end

  def run do
    log "comprehension"
    log for n <- [1,2,3,4], do: n * n
    values = [good: 1, good: 2, bad: 3, good: 4]
    log(for {:good, n} <- values, do: n * n)

    multiple_of_3? = fn(n) -> rem(n, 3) == 0 end
    log(for n <- 0..5, multiple_of_3?.(n), do: n * n)

    dirs = ['/Users/mori-daisuke', '~/.ghq/']
    log(for dir <- dirs,
      file <- File.ls!(Path.expand(dir)),
      path = Path.join(dir, file),
      File.regular?(path) do
        File.stat!(path).size
      end)

    log(for i <- [:a, :b, :c], j <- [1,2], do: {i, j})

    log(Triple.pythagorean(5))
    log(Triple.pythagorean(12))
    log(Triple.pythagorean(48))

    log(for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>)
    log(for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val * val})

    stream = IO.stream(:stdio, :line)
    for line <- stream, into: stream do
      String.upcase(line) <> "\n"
    end
  end

  def log(item) do
    item
    |> inspect
    |> IO.puts
  end

  def even?(n) when is_integer(n) do
    rem(n, 2) == 0
  end

  
end

ComprehensionsSample.run
