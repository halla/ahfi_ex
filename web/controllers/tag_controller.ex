defmodule AhfiEx.TagController do
    use AhfiEx.Web, :controller
    alias AhfiEx.RepoJournal
    alias AhfiEx.Tag

    def index(conn, _params) do
        tags = RepoJournal.all(from t in Tag, order_by: t.name)

        render conn, "index.html", tags: tags
    end

    def list(conn, _params) do
        tags = RepoJournal.all(from t in Tag, order_by: t.name)
        render conn, "list.json", data: tags
    end

    def new(conn, _params) do
        changeset = Tag.changeset(%Tag{})
        render conn, "new.html", changeset: changeset
    end

    def slugify(tagname) do
        tagname
        |> String.strip
        |> String.downcase
    end

    def create(conn, %{"tag" => tag_params}) do
        tag_params = Dict.put_new(tag_params, "slug", slugify(tag_params["name"]))

        changeset = Tag.changeset(%Tag{}, tag_params)

        tag = RepoJournal.insert(changeset)
        case tag do
            {:ok, tag} ->
                conn
                |> put_flash(:info, "New tag created.")
                |> redirect(to: tag_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end

    end
    
end
