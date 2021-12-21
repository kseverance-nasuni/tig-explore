defmodule HttpDataWeb.PointView do
  use HttpDataWeb, :view
  alias HttpDataWeb.PointView

  def render("index.json", %{points: points}) do
    %{data: render_many(points, PointView, "point.json")}
  end

  def render("show.json", %{point: point}) do
    %{data: render_one(point, PointView, "point.json")}
  end

  def render("point.json", %{point: point}) do
    %{
      id: point.id,
      prop: point.prop,
      filer: point.filer,
      volume: point.volume,
      t: point.t,
    }
  end
end
