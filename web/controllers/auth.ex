defmodule AhfiEx.Auth do
    import Plug.Conn
    import Phoenix.Controller

    def init(opts) do
        Keyword.fetch!(opts, :repo)
    end

    def call(conn, repo) do
        user_id = get_session(conn, :user_id)
        #user = user_id && repo.get(Ahfi.User, user_id)
        user = user_id && %AhfiEx.User{id: 1, username: "antti" }
        assign(conn, :current_user, user)
    end

    def authenticate_user(conn, _opts) do
        if conn.assigns.current_user do
            conn
        else
            conn
            |> put_flash(:error, "You must be logged in to do that.")
            |> redirect(to: "/")
            |> halt()
        end

    end

end
