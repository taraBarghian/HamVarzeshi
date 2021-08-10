# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ham_varzeshi,
  ecto_repos: [HamVarzeshi.Repo]

# Configures the endpoint
config :ham_varzeshi, HamVarzeshiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o9FzzsdxmYuOO95J5HdUSAPi3gDMkJfFHM1kQKeTZ5CxMkD/+hkdPVj2wZZIkuO7",
  render_errors: [view: HamVarzeshiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HamVarzeshi.PubSub,
  live_view: [signing_salt: "04EBx7s2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


#authen
config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile"]}
  ]
config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: "300819715886-2qfnrchu3hauf2vcajrdmhu5ig9132kr.apps.googleusercontent.com", # Dummy code
  client_secret: "kSyguTXhN0k3-2dcY4GzaoVE", # Dummy code
  redirect_uri: "http://localhost:4000/auth/google/callback"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
