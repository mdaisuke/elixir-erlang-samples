defmodule HelloWeb.BackgroundJob.Plug do
  def init(opts), do: opts
  def call(conn, opts) do
    conn
    |> Plug.Conn.assign(:name, Keyword.get(opts, :name, "Background Job"))
    |> HelloWeb.BackgroundJob.Router.call(opts)
  end
end

defmodule HelloWeb.BackgroundJob.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/", do: send_resp(conn, 200, "welcome to #{conn.assigns.name}")
  get "/active", do: send_resp(conn, 200, "5 active jobs")
  get "/pending", do: send_resp(conn, 200, "3 pending jobs")
  match _, do: send_resp(conn, 404, "not found")
end
