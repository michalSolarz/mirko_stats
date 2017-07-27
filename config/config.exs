# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mirko_stats,
  ecto_repos: [MirkoStats.Repo]

# Configures the endpoint
config :mirko_stats, MirkoStats.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jeQH1vGiicJ310cyFIhvvXwvC/Rnz8XfJcODLGMGtJGSyu8rA0gzpPknyA0Y59rY",
  render_errors: [view: MirkoStats.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MirkoStats.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
