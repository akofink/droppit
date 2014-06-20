defmodule Droppit.Controllers.Pages do
  use Phoenix.Controller
  use Droppit.Controllers.Application

  def index(conn) do
    html conn, view(:welcome)
  end
end
