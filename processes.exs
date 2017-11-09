defmodule MyProcess do
  def run do
    send self(), {:hello, "one"}
    send self(), {:world, "two"}
    loop()
  end

  def wait do
    IO.puts("wait")
    receive do
      {:hello, msg} -> "hello #{msg}"
    end
    receive do
      {:world, msg} -> "world #{msg}"
    end
  end

  def loop do
    IO.puts(wait())
    loop()
  end
end

MyProcess.run

