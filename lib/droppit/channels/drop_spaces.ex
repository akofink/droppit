defmodule Droppit.Channels.DropSpaces do
  use Phoenix.Channel

  def join(socket, topic, message) do
    IO.puts "JOIN: #{socket.channel}:#{topic}"
    broadcast socket, "user:entered", message
    {:ok, socket}
  end

  def event(socket, "file:dropped", args) do
    broadcast socket, "file:dropped", args
    socket
  end
end
