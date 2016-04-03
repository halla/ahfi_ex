defmodule AhfiEx.LayoutView do
  use AhfiEx.Web, :view

  def gtmcode() do
      Application.get_env(:ahfi_ex, :gtm)[:id]
  end


end
