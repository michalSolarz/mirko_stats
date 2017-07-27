defmodule MirkoStats.Models.EntryStats do
  @moduledoc false

  use MirkoStats.Web, :model

  schema "entries_stats" do
    field :page, :integer
    field :period, :integer
    field :position, :integer
    field :vote_count, :integer
    field :comment_count, :integer

    belongs_to :entry, MirkoStats.Models.Entry

    timestamps()
  end

end