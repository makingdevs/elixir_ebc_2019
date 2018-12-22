defmodule Twinder.User do
  defstruct name: "", lastname: "", username: "", followers: []

  def new(username) do
    %Twinder.User{username: username}
  end
end
