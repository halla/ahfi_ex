defmodule AhfiEx.EntryController do
    use AhfiEx.Web, :controller

    alias AhfiEx.Entry


    def index(conn, _params) do
        items = RepoJournal.all(from e in Entry, order_by: [desc: e.created] )
        render(conn, "index.html", items: items)
    end

    def show(conn, %{"id" => id}) do
      post = RepoJournal.get!(Entry, id)
      query = from p in Entry,
          where: p.created > ^post.created,
          order_by: p.created,
          limit: 1
      nextPost = RepoJournal.one(query)
      query2 = from p in Entry,
          where: p.created < ^post.created,
          order_by: [desc: p.created],
          limit: 1,
          offset: 1 # some quirk
      prevPost = RepoJournal.one(query2)
      
      render(conn,
          "show.html",
          item: post,
          nextPost: nextPost,
          prevPost: prevPost)

    end

end
