defmodule AhfiEx.PageController do
  use AhfiEx.Web, :controller

  def index(conn, _params) do
    posts = Repo.all(from p in AhfiEx.Post, order_by: [desc: p.date_published])
    render conn, "index.html", posts: posts
  end
end
