defmodule Droppit.Controllers.Application do
  use Calliope.Engine, layout: "application"
  defmacro __using__(_args) do
    quote do
      import unquote(__MODULE__)
    end
  end

  def view(name) do
    content_with_layout(name, [])
  end
end
