defmodule Droppit.User do
  @derive [Access]
  defstruct username: "", messages: []

  def new(username) do
    user = %__MODULE__{username: username}
    Agent.start_link fn -> user end
  end

  def get(agent) do
    Agent.get(agent, fn user -> user end)
  end

  def add_message(agent, message) do
    Agent.update(agent, fn user -> update_in(user, [:messages], &([message | &1])) end)
  end
end
