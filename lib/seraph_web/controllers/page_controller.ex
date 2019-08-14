defmodule SeraphWeb.PageController do
  use SeraphWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
