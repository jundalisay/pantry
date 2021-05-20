defmodule PantryWeb.Router do
  use PantryWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PantryWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :set_locale do
    plug(SetLocale,
      gettext: OneWeb.Gettext,
      default_locale: "en",
      cookie_key: "project_locale",
      additional_locales: ["tl", "cb"]
    )
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end



  scope "/", PantryWeb do
    pipe_through [:browser, :protected]    

    live "/", PostLive.Index, :index
    live "/posts/new", PostLive.Index, :new
    live "/posts/:id/edit", PostLive.Index, :edit
    live "/posts/:id", PostLive.Show, :show
    live "/posts/:id/show/edit", PostLive.Show, :edit
    get "/dash", UserController, :dash
    resources "/companies", CompanyController
    resources "/hubs",      HubController
    resources "/users",     UserController 
    resources "/records",   RecordController
    resources "/promos",    PromoController    
  end

    
  scope "/api", PantryWeb.Api, as: :api do

    pipe_through :api
    resources "/hubs", HubController, only: [:index, :show]
    resources "/posts", PostController, only: [:index, :show]
    # resources "/records", RecordController, only: [:index, :show]
  end


  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PantryWeb.Telemetry
    end
  end
end
