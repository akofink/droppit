defmodule Droppit.Router do
  use Phoenix.Router

  plug Plug.Static, at: "/static", from: :droppit
  get "/", Droppit.Controllers.Pages, :index, as: :page
end
