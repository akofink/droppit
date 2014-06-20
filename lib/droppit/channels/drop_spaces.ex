defmodule Droppit.Channels.DropSpaces do
  use Phoenix.Channel

  def join(socket, topic, message) do
    IO.puts "JOIN: #{socket.channel}:#{topic}"
    broadcast socket, "user:entered", username: message["message"] || "anonymous"
    {:ok, socket}
  end

  def event(socket, "file:dropped", file) do
    broadcast socket, "file:dropped", file: file
    socket
  end
end
