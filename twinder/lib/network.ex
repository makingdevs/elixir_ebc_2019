defmodule Twinder.Network do
  alias Twinder.User
  alias HTTPoison.Response
  import String, only: [replace: 3]
  import Enum, only: [map: 2]

  @url "https://api.github.com/users/{username}/followers"

  def get_followers_of(username) do
    @url
    |> replace("{username}", username)
    |> HTTPoison.get!()
    |> parse_response
    |> obtain_usernames
    |> generate_users
  end

  defp parse_response(%Response{body: body}) do
    body |> Poison.decode!
  end

  defp obtain_usernames(list_of_users) do
    list_of_users
    |> map(&(&1["login"]))
  end

  defp generate_users(list_of_usernames) do
    list_of_usernames
    |> map(&User.new/1)
  end

end
