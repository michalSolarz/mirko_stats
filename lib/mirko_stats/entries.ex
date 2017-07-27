defmodule MirkoStats.Entries do
  @moduledoc false
    use HTTPoison.Base

    def process_url(url) do
        url
    end

    def process_response_body(body) do
      body
      |> Poison.decode!(as: [%MirkoStats.Entry{voters: [%MirkoStats.Voter{}], embed: %MirkoStats.Embed{}}])
    end
end