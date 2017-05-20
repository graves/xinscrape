defmodule Xinscrape.Helpers do
  def remove_html(actions) do
    actions
    |> Enum.map(fn(action) ->
         String.replace(action, ~r/<[^>]*>/, "")
       end)
  end
end
