defmodule HamVarzeshiWeb.PageController do
  use HamVarzeshiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
