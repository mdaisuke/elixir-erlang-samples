defmodule User do
  defstruct [:first_name, :last_name, :age]

  def name(user) do
    "#{user.first_name} #{user.last_name}"
  end
end
