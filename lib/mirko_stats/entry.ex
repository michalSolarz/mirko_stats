defmodule MirkoStats.Entry do
  @moduledoc false
  @derive [Poison.Encoder]
  defstruct [:id,
            :author,
            :author_group,
            :date,
            :body,
            :url,
            :receiver,
            :receiver_group,
            :comments,
            :voters,
            :embed,
            :page,
            :period,
            :position,
            :vote_count,
            :comment_count]
end