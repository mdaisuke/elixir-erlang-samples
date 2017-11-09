defmodule Echo do
  def run do
    receive do
      {from, msg} ->
        send from, msg
    end
    run()
  end
end
