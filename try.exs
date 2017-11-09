defmodule TrySample do

  defmodule MyError do
    defexception message: "default message"
  end

  def run do
    log("try catch rescue")
    #log(:foo + 1)
    #raise "oops"
    #raise ArgumentError, message: "invalid argument foo"
    #raise MyError
    #raise MyError, message: "hoge"

    try do
      raise "oops"
    rescue
      e in RuntimeError -> log(e)
      e in ArgumentError -> log(e)
    end
    try do
      raise "oops"
    rescue
      RuntimeError -> log("Error!")
    end

    case File.read "hello.txt" do
      {:ok, body} -> log("Success: #{body}")
      {:error, reason} -> log("Success: #{reason}")
    end

    #File.read! "unknown"

    try do
      Enum.each -50..50, fn(x) ->
        if rem(x, 13) == 0, do: throw(x)
      end
      log("got nothing")
    catch
      x -> log("Got #{x}")
    end

    log(Enum.find -50..50, &(rem(&1, 13) == 0))

    try do
      exit "I am exiting"
    catch
      :exit, _ -> log("not really")
    end

    {:ok, file} = File.open "sample", [:utf8, :write]
    try do
      IO.write file, "ola"
      #raise "oops, something went wrong"
    after
      File.close(file)
    end

    #without_even_trying

    x = 2
    try do
      1 / x
    rescue
      ArithmeticError ->
        log(:infinity)
    else
      y when y < 1 and y > -1 ->
        log(:small)
      _ ->
        log(:large)
    end

    try do
      raise "fail"
      what_happened = :did_not_raise
    rescue
      _ -> what_happened = :rescued
    end
    #log(what_happened)
  end

  def log(item) do
    item
    |> inspect
    |> IO.puts
  end

  def without_even_trying do
    raise "oops"
  after
    log("clearning up")
  end
end

TrySample.run
