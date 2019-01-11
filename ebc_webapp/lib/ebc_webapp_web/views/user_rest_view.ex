defmodule EbcWebappWeb.UserRestView do
  use EbcWebappWeb, :view
  alias EbcWebappWeb.UserRestView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserRestView, "user_rest.json")}
  end

  def render("show.json", %{user_rest: user_rest}) do
    %{users: render_one(user_rest, UserRestView, "user_rest.json")}
  end

  def render("user_rest.json", %{user_rest: user_rest}) do
    %{
      id: user_rest.id,
      username: user_rest.username,
      full_name: user_rest.full_name,
      email: user_rest.email,
      born_date: user_rest.born_date,
      custom: "#{user_rest.id} - #{user_rest.username}"
    }
  end
end
