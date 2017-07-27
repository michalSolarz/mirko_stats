defmodule MirkoStats.Scrapper do
  @moduledoc false
  def get_tracked_pages do
    [6, 12, 24]
    |> Enum.map(fn period -> period end)
    |> Enum.map(fn period ->
     1..10
     |> Enum.map(fn x -> %{page: x, period: period} end)
     end)
    |> List.flatten

  end

  def get_api_endpoint do
    System.get_env("WYKOP_API_ENDPOINT")
  end

  def get_api_key do
    System.get_env("WYKOP_API_KEY")
  end

  def scrap_stream_hot do
    get_tracked_pages()
    |> Enum.map(&Task.async(fn  -> MirkoStats.StreamHot.get_entries_from_period(&1.period, &1.page) end))
    |> Enum.map(&Task.await(&1, 50000))
    |> List.flatten
  end
end