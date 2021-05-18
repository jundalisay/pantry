use Mix.Config

config :pantry,
  ecto_repos: [Pantry.Repo]


config :pantry, PantryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v8P8pP/RH2ACQihvnszedya62BykwwS0suNXnlmttBO8MLM6/5qyvXp5lG1n7BWr",
  render_errors: [view: PantryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pantry.PubSub,
  live_view: [signing_salt: "lP3th2O8"]


config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :phoenix, :json_library, Jason

config :pantry, :pow,
  user: Pantry.Users.User,
  repo: Pantry.Repo,
  web_module: PantryWeb

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine,
  slimleex: PhoenixSlime.LiveViewEngine

import_config "#{Mix.env()}.exs"
