defmodule HttpDataWeb.PointController do
  use HttpDataWeb, :controller

  require Logger

  action_fallback HttpDataWeb.FallbackController

  def index(conn, _params) do
    IO.inspect(conn.req_headers, label: "HEADERS")
    IO.inspect(conn.query_string, label: "QUERY")

    points = HttpData.Data.list_points()
    render(conn, "index.json", points: points)
  end

end
