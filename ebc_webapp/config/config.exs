# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ebc_webapp,
  ecto_repos: [EbcWebapp.Repo]

# Configures the endpoint
config :ebc_webapp, EbcWebappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ftt3GJm5aevN5fwK8cOQ8mbWBIJRh0I9lN+lx8r+viKTN68MFJ3za6M8rKr2Pui+",
  render_errors: [view: EbcWebappWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EbcWebapp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
