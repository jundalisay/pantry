# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pantry,
  ecto_repos: [Pantry.Repo]

# Configures the endpoint
config :pantry, PantryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v8P8pP/RH2ACQihvnszedya62BykwwS0suNXnlmttBO8MLM6/5qyvXp5lG1n7BWr",
  render_errors: [view: PantryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pantry.PubSub,
  live_view: [signing_salt: "lP3th2O8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
