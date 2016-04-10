defmodule AhfiEx.UserController do
    use AhfiEx.Web, :controller

    def login(conn, _params) do
        conn
        |> put_session(:user_id, 1)
        |> configure_session(renew: true)
        |> put_flash(:info, "Logged in!" )
        |> redirect(to: "/" )
    end

    def logout(conn, _params) do
        conn
        |> configure_session(drop: true)
        |> put_flash(:info, "Logged out!" )
        |> redirect(to: "/" )
    end


end
