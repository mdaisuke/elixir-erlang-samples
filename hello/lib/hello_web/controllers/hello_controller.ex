defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  plug :assign_welcome_message, "Welcome Back"

  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def show(conn, %{"messenger" => messenger} = _params) do
    #render conn, "show.html", messenger: messenger
    conn
    |> assign(:messenger, messenger)
    |> render "show.html"
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end


