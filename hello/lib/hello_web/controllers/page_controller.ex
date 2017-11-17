defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "welcome")
    |> put_flash(:error, "error")
    |> render "index.html"
  end

  def show(conn, %{"id" => id} = _params) do
    #text conn, "showing id #{id}"
    html conn, """
    <html>
      <head>
        <title>Passing an Id</title>
      </head>
      <body>
        <p>You sent in id #{id}</p>
      </body>
    </html>
    """
  end
end
