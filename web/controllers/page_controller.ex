defmodule AhfiEx.PageController do
  use AhfiEx.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
