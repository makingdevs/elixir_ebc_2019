defmodule Twinder.Plug do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  post "/hello" do
    send_resp(conn, 203, "Done!! ^_^")
  end

  match _ do
    send_resp(conn, 404, "Not found oops!!!")
  end

end
