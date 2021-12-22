defmodule HttpDataWeb.PointView do
  use HttpDataWeb, :view
  alias HttpDataWeb.PointView

  def render("index.json", %{points: points}) do
    %{data: render_many(points, PointView, "point.json")}
  end

  def render("show.json", %{point: point}) do
    %{data: render_one(point, PointView, "point.json")}
  end

  def render("point.json", %{point: %HttpData.Data.Propagation{} = point}) do
    %{
      t: point.t,
      filer: point.filer,
      volume: point.volume,
      prop: point.prop,
      kind: point.kind,
    }
  end

  def render("point.json", %{point: %HttpData.Data.VolumeInfo{} = point}) do
    %{
      t: point.t,
      volume: point.volume,
      mode: point.mode,
      profile: point.profile,
      time_to_protect: point.time_to_protect,
    }
  end

end
