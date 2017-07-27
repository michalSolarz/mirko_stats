defmodule MirkoStats.Repo.Migrations.AddColumnEntryIsActive do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :is_active, :boolean
    end
  end
end
