defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    #conn
    #|> put_layout(false)
    #|> render "index.html"
    render conn, :index
  end

  def test(conn, _params) do
    render conn, "test.html"
  end
end
