defmodule AhfiEx.PageController do
  use AhfiEx.Web, :controller

  def index(conn, _params) do
    posts = Repo.all(AhfiEx.Post)
    render conn, "index.html", posts: posts
  end
end
