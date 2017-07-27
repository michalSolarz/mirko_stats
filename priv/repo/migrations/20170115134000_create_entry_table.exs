defmodule MirkoStats.Repo.Migrations.CreateEntryTable do
  use Ecto.Migration

  def change do
    create table(:entries) do
     add :orginal_id, :integer
     add :author, :string
     add :author_group, :integer
     add :date, :naive_datetime
     add :body, :text
     add :url, :string
     add :receiver, :string
     add :receiver_group, :integer
     timestamps()
    end

    create unique_index(:entries, [:orginal_id])

  end
end
