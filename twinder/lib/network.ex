defmodule Twinder.Network do

  @url "https://api.github.com/users/{username}/followers"

  def get_users_of(username) do
    @url
    |> String.replace("{username}", username)
    |> HTTPoison.get!()
  end

end
