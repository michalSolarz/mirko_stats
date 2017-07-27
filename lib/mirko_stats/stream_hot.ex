defmodule MirkoStats.StreamHot do
  @moduledoc false
  alias MirkoStats.Entries
  alias MirkoStats.Scrapper

  def get_entries_from_period(period, page) do
    Entries.start()

    Entries.get!(get_url(period, page)).body()
    |> Enum.with_index(1)
    |> Enum.map(fn {entry, position} ->
        %{entry | page: page, period: period, position: position}
        end)
  end

  defp get_url(period, page) do
    Scrapper.get_api_endpoint() <> "stream/hot/appkey," <> get_api_key(period) <> ",output,clear,page," <> to_string(page) <> ",period," <> to_string(period)
  end

  defp get_api_key(period) do
    api_keys = [
            System.get_env("WYKOP_API_KEY_HOT_STREAM_PERIOD_6_1"),
            System.get_env("WYKOP_API_KEY_HOT_STREAM_PERIOD_6_2"),
            System.get_env("WYKOP_API_KEY_HOT_STREAM_PERIOD_6_3"),
            System.get_env("WYKOP_API_KEY_HOT_STREAM_PERIOD_6_4"),
            System.get_env("WYKOP_API_KEY_HOT_STREAM_PERIOD_6_5")
        ]

        case period do
          _ ->
            Enum.random(api_keys)
        end
  end
end