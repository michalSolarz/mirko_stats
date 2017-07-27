defmodule MirkoStats.Repo.Migrations.CreateEntryStatsTable do
  use Ecto.Migration

  def change do
    create table(:entries_stats) do
          add :page, :integer
          add :period, :integer
          add :position, :integer
          add :vote_count, :integer
          add :comment_count, :integer
          add :entry_id, references(:entries, on_delete: :nothing)

          timestamps()
    end
    create index(:entries_stats, [:entry_id, :period, :page, :position])

  end
end
