defmodule HelloWeb.RoomChannel do
  use HelloWeb, :channel
  alias HelloWeb.Presence

  def join("room:lobby", _params, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    push socket, "presence_status", Presence.list(socket)
    {:ok, _}= Presence.track(socket, socket.assigns.user_id, %{
      online_at: inspect(System.system_time(:seconds))
    })
    {:noreply, socket}
  end
end
