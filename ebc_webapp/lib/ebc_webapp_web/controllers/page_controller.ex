defmodule EbcWebappWeb.PageController do
  use EbcWebappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn, _params) do
    text conn, "Hello Phoenix!!!"
  end
end
