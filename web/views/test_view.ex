defmodule HelloPhoenix.TestView do
  use HelloPhoenix.Web, :view

  def handler_info(conn) do
    "my Request Handled By: #{controller_module conn}.#{action_name conn}"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end
end
