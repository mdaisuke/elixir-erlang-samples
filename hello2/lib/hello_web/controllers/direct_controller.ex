defmodule HelloWeb.DirectController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> send_resp(201, "")
  end
end
