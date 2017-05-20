defmodule Xinscrape.Parser do
  def parse_reply_count(body) do
    # i guess the reply count isnt here oh well
    # we can just increment the offset by 30
    # until :user_actions is empty
    body
  end

  def parse_excerpts(body) do
    body.user_actions
    |> Enum.map(fn(action) -> action.excerpt end)
  end
end
