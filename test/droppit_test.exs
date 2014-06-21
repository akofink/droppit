defmodule DroppitTest do
  use ExUnit.Case
  alias Droppit.UserManager
  alias Droppit.User

  test "adding a user" do
    UserManager.add_user("Jack")
    {:ok, pid} = UserManager.get_user("Jack")
    User.add_message(pid, "Test")
    assert User.get(pid).messages == ["Test"]
  end
end
