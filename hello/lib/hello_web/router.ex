defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HelloWeb.Plugs.Locale, default: "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/:id", PageController, :show
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    #get "/", RootController, :index
    
    resources "/users", UserController

    forward "/jobs", BackgroundJob.Plug, name: "Hello Phoenix"
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
