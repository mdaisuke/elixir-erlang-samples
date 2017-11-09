defmodule ComprehensionsSample do

  def run do
    log "comprehension"
    log for n <- [1,2,3,4], do: n * n
  end

  def log(item) do
    item
    |> inspect
    |> IO.puts
  end
  
end

ComprehensionsSample.run
