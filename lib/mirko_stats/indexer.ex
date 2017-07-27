defmodule MirkoStats.Indexer do
  @moduledoc false
  import Ecto.Query

  def index_entries() do
    entries = MirkoStats.Scrapper.scrap_stream_hot()
    Enum.count entries
    index_entries_ids = entries
    |> Enum.map(fn entry ->
            {:ok, date} = Ecto.DateTime.cast(entry.date)
            indexed_entry = case MirkoStats.Repo.get_by(MirkoStats.Models.Entry, orginal_id: entry.id) do
                nil  -> %MirkoStats.Models.Entry{orginal_id: entry.id,
                                                        author: entry.author,
                                                        author_group: entry.author_group,
                                                        date: date,
                                                        body: entry.body,
                                                        url: entry.url,
                                                        receiver: entry.receiver,
                                                        receiver_group: entry.receiver_group}
                existing_entry -> existing_entry
          end


          entry_stats = %MirkoStats.Models.EntryStats{page: entry.page,
                                                      period: entry.period,
                                                      position: entry.position,
                                                      vote_count: entry.vote_count,
                                                      comment_count: entry.comment_count,
                                                      entry: indexed_entry}
          MirkoStats.Repo.insert(entry_stats)
          indexed_entry.id
    end)

    from(e in MirkoStats.Models.Entry, where: e.id in ^index_entries_ids)
    |> MirkoStats.Repo.update_all(set: [is_active: true])

  end

  def select_active_entries() do
    MirkoStats.Models.Entry
    |> where([e], e.is_active == true)
  end

  def inactivate_entries() do
    select_active_entries()
    |> inactivate_entries()
  end

  def inactivate_entries(entries) do
    entries
    |> MirkoStats.Repo.update_all(set: [is_active: false])
  end
end