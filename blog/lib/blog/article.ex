defmodule Blog.Article do
  use Ecto.Schema

  schema "articles" do
    field :title, :string
    field :body, :string
    timestamps()

    belongs_to :user, Blog.User
  end
end
