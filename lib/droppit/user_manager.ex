defmodule Droppit.UserManager do
  alias Droppit.User
  use ExActor.GenServer, export: :user_manager

  definit do
    {:ok, %{}}
  end

  defcast add_user(username), state: users do
    users
    |> Dict.put(username, User.new(username))
    |> new_state
  end

  defcall get_user(username), state: users do
    users
    |> Dict.get(username)
    |> reply
  end
end
