defmodule MirkoStats.ScrapperWorker do
  @moduledoc false
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work() # Schedule work to be performed at some point
    {:ok, state}
  end

  def handle_info(:work, state) do
    MirkoStats.Indexer.inactivate_entries()
    MirkoStats.Indexer.index_entries()
    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 5 * 60 * 1000)
  end
end