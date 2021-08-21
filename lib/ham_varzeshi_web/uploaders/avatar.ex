defmodule HamVarzeshi.Avatar do
  use Arc.Definition
  use Arc.Ecto.Definition
  def __storage, do: Arc.Storage.Local
  # Include ecto support (requires package arc_ecto installed):
  # use Arc.Ecto.Definition

  @versions [:original]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Override the persisted filenames:
  def filename(version, {file, scope}) do
    file_name = Path.basename(file.file_name, Path.extname(file.file_name))
    "#{scope.id}_#{version}_#{file_name}"
  end

  # Override the storage directory:
  def storage_dir(version, {file, scope}) do
    "uploads/gyms/avatars/#{scope.id}"
  end

  # Provide a default URL if there hasn't been a file uploaded
  def default_url(version, scope) do
     HamVarzeshiWeb.Endpoint.url <> "/uploads/gyms/default/default.png"
  end

end
