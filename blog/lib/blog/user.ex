defmodule Blog.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :name, :string
    timestamps()

    has_many :articles, Blog.Article
  end
end
