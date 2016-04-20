defmodule AhfiEx.Router do
  use AhfiEx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AhfiEx.Auth, repo: AhfiEx.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AhfiEx do
    pipe_through :browser # Use the default browser stack
    get "/login", UserController, :login
    get "/logout", UserController, :logout
    get "/", PageController, :index
    get "/blog/feeds/rss/", PostController, :rss
    get "/blog/:year/:month/:slug/", PostController, :view
    resources "/post", PostController
    resources "/tag", TagController
  end

  scope "/journal", AhfiEx do
      pipe_through [:browser, :authenticate_user]
      resources "/entry", EntryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AhfiEx do
  #   pipe_through :api
  # end
end
