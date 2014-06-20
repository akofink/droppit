defmodule Droppit.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  plug Plug.Static, at: "/static", from: :droppit

  get "/", Droppit.Controllers.Pages, :index, as: :page

  channel "drop_spaces", Droppit.Channels.DropSpaces
end
