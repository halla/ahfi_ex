defmodule AhfiEx.PostView do
  use AhfiEx.Web, :view
  use Timex

  def absolute_url(conn, %AhfiEx.Post{slug: slug, date_published: date_published}) do
      yearmonth = Timex.format(date_published, "{YYYY}/{0M}/") |> case do
            {:ok, content} -> content
            {:error, error } -> to_string error
      end
      (to_string conn.scheme) <> "://" <> conn.host <> "/blog/" <> yearmonth <> slug
  end

  def format_date(datetime) do
      Timex.format(datetime, "{YYYY}-{0M}-{0D}")
      |> case do
          {:ok, content} -> content
          {:error, _ } -> ""
      end
  end

  def rss_date(datetime) do
      Timex.format(datetime, "{RFC822}")
      |> case do
          {:ok, content} -> content
          {:error, _ } -> ""
      end
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end
end
