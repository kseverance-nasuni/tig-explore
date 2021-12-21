defmodule HttpData.Data do
  @moduledoc """
  The Data context.
  """

  @doc """
  Returns the list of points.

  ## Examples

      iex> list_points()
      [%Point{}, ...]

  """
  def list_points do
    now = DateTime.utc_now

    filers = [ "boston", "marlboro" ]
    volumes = [ "engineering" ]

    Enum.map(1..5, fn x ->
      %HttpData.Data.Point{
        id: :"#{Integer.to_string(DateTime.to_unix(now), 16)}.#{x}",
        prop: :rand.uniform(10),
        filer: Enum.random(filers),
        volume: Enum.random(volumes),
        t: DateTime.to_iso8601(now)
      }
    end)
  end

end
