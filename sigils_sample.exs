defmodule SiglsSample do

  defmodule MySigils do
    def sigil_i(string, []), do: String.to_integer(string)
    def sigil_i(string, [?n]), do: -String.to_integer(string)
  end

  def run do
    log("sigils")
    regex = ~r/foo|bar/
    log("foo" =~ regex)
    log("bat" =~ regex)
    log("HELLO" =~ ~r/hello/)
    log("HELLO" =~ ~r/hello/i)
    log(~s(thisis a string with "double" qoutes, not 'single' ones))
    log(~c(this is a char list containering 'single quotes'))
    log(~w(foo bar bat))
    log(~w(foo bar bat)a)
    log(~w(foo bar bat)s)
    log(~w(foo bar bat)c)
    log(~s(String with escape codes \x26 #{"inter" <> "polation"}))
    log(~S(String with escape codes \x26 #{"inter" <> "polation"}))
    import MySigils
    log(~i(13))
    log(~i(13)n)
  end

  def log(item) do
    item
    |> inspect
    |> IO.puts
  end
end

SiglsSample.run
