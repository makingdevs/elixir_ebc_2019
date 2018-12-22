defmodule Twinder.Network do

  @url "https://api.github.com/users/{username}/followers"

  def get_users_of(username) do
    @url
    |> String.replace("{username}", username)
    |> HTTPoison.get!()
    |> parse_response
    |> obtain_usernames
    |> generate_users
  end

  defp parse_response(%HTTPoison.Response{body: body}) do
    body |> Poison.decode!
  end

  defp obtain_usernames(list_of_users) do
    list_of_users
    |> Enum.map(fn m -> m["login"] end)
  end

  defp generate_users(list_of_usernames) do
    list_of_usernames
    |> Enum.map(&Twinder.User.new/1)
  end

end
