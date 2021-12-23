defmodule HttpData.Data do
  @moduledoc """
  The Data context.
  """

  @filers [
    "boston", "marlboro", "atlanta", "akron", "hartford",
    "miami", "austin", "denver", "albany", "richmond"
  ]
  @volumes [
    "engineering"
  ]

  @doc """
  Returns the list of points.

  ## Examples

      iex> list_points()
      [%Point{}, ...]

  """
  def list_points do
    propagations() ++
      locks() ++
      volume_infos(:rand.uniform(10))
  end

  defp propagations() do
    prop_kinds = [ "collab", "protect" ]
    now = DateTime.utc_now
    [
      %HttpData.Data.Propagation{
        t: DateTime.to_iso8601(now),
        filer: Enum.random(@filers),
        volume: Enum.random(@volumes),
        prop: :rand.uniform(100),
        kind: Enum.random(prop_kinds),
      }
    ]
  end

  defp volume_infos(x) when x >= 8 do
    now = DateTime.utc_now
    gfa_mode = [ "off", "active", "observation" ]
    gfa_profile = [ "collab-only", "collab-some", "even-steven", "protect-some", "protect-only" ]
    ttp = [ 90, 120, 180 ]
    [
      %HttpData.Data.VolumeInfo{
        t: DateTime.to_iso8601(now),
        volume: Enum.random(@volumes),
        mode: Enum.random(gfa_mode),
        profile: Enum.random(gfa_profile),
        time_to_protect: Enum.random(ttp)
      }
    ]
  end
  defp volume_infos(_), do: []

  defp locks do
    now = DateTime.utc_now
    volume = Enum.random(@volumes)
    filer = Enum.random(@filers)
    phase = Enum.random(["P1", "P2"])
    [
      %HttpData.Data.Lock{
        t: DateTime.to_iso8601(DateTime.add(now, -1 * :rand.uniform(60))),
        volume: volume,
        filer: filer,
        phase: phase,
        state: "ACQUIRED",
      },
      %HttpData.Data.Lock{
        t: DateTime.to_iso8601(now),
        volume: volume,
        filer: filer,
        phase: phase,
        state: "RELEASED",
      }
    ]
  end


end
