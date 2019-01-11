defmodule EbcWebappWeb.UserRestController do
  use EbcWebappWeb, :controller

  alias EbcWebapp.Twinder
  alias EbcWebapp.Twinder.User

  action_fallback EbcWebappWeb.FallbackController

  def index(conn, _params) do
    users = Twinder.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user_rest" => user_rest_params}) do
    with {:ok, %User{} = user_rest} <- Twinder.create_user_rest(user_rest_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_rest_path(conn, :show, user_rest))
      |> render("show.json", user_rest: user_rest)
    end
  end

  def show(conn, %{"id" => id}) do
    user_rest = Twinder.get_user_rest!(id)
    render(conn, "show.json", user_rest: user_rest)
  end

  def update(conn, %{"id" => id, "user_rest" => user_rest_params}) do
    user_rest = Twinder.get_user_rest!(id)

    with {:ok, %User{} = user_rest} <- Twinder.update_user_rest(user_rest, user_rest_params) do
      render(conn, "show.json", user_rest: user_rest)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_rest = Twinder.get_user_rest!(id)

    with {:ok, %User{}} <- Twinder.delete_user_rest(user_rest) do
      send_resp(conn, :no_content, "")
    end
  end
end
