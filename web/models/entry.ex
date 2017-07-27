defmodule MirkoStats.Models.Entry do
  @moduledoc false

  use MirkoStats.Web, :model

  schema "entries" do
    field :orginal_id, :integer
    field :author, :string
    field :author_group, :integer
    field :date, :naive_datetime
    field :body, :string
    field :url, :string
    field :receiver, :string
    field :receiver_group, :integer
    field :is_active, :boolean
    has_many :stats, MirkoStats.Models.EntryStats

    timestamps()
  end

end