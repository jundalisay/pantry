defmodule PantryWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :pantry


  @session_options [
    store: :cookie,
    key: "_pantry_key",
    signing_salt: "mDlgdmDR"
  ]

  socket "/socket", PantryWeb.UserSocket,
    # websocket: true,
    websocket: [timeout: 45_000],
    longpoll: false

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]


  plug Plug.Static,
    at: "/",
    from: :pantry,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :pantry
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug Pow.Plug.Session, otp_app: :pantry
  plug PantryWeb.Router

end
