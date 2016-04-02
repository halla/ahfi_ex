defmodule AhfiEx.Router do
  use AhfiEx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AhfiEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/blog/feeds/rss/", PostController, :rss
    get "/blog/:year/:month/:slug/", PostController, :view
    resources "/post", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AhfiEx do
  #   pipe_through :api
  # end
end
