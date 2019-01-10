use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ebc_webapp, EbcWebappWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ebc_webapp, EbcWebapp.Repo,
  username: "postgres",
  password: "postgres",
  database: "ebc_webapp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
