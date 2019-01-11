defmodule EbcWebappWeb.Router do
  use EbcWebappWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EbcWebappWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", PageController, :hello
    resources "/users", UserController
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EbcWebappWeb do
  #   pipe_through :api
  # end
end
