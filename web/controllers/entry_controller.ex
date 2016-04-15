defmodule AhfiEx.EntryController do
    use AhfiEx.Web, :controller

    alias AhfiEx.Entry
    alias AhfiEx.Tag
    alias AhfiEx.TaggedItem


    def index(conn, _params) do
        items = RepoJournal.all(from e in Entry, order_by: [desc: e.created] )
        render(conn, "index.html", items: items)
    end

    def show(conn, %{"id" => id}) do      
      post = RepoJournal.get!(Entry, id) |> RepoJournal.preload([tags: :tag])

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

    def new(conn, _params) do
        now = Ecto.DateTime.utc
        changeset = Entry.changeset(%Entry{created: now})

        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"entry" => entry_params }) do
        changeset = Entry.changeset(%Entry{}, entry_params)

        case RepoJournal.insert(changeset) do
            {:ok, entry} ->
                conn
                |> put_flash(:info, "Entry saved!")
                |> redirect(to: entry_path(conn, :index))
            {:error, entry} ->
                render conn, "new.html", changeset: changeset
        end
    end

end
