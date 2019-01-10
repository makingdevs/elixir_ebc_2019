defmodule EbcWebappWeb.PageController do
  use EbcWebappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn, params) do
    IO.inspect params
    render(conn, "hello.html")
  end
end
