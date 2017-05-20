defmodule Xinscrape.Helpers do
  @self_words ["me", "myself", "i", "xintani", "xin"]

  def remove_html(quotes) do
    quotes
    |> Enum.map(fn(aquote) ->
         String.replace(aquote, ~r/<[^>]*>/, "")
       end)
  end

  def about_self(quotes) do
    quotes
    |> Enum.filter(fn(aquote) ->
         is_about_self?(aquote)
       end)
  end

  def is_about_self?(aquote) do
    @self_words
    |> Enum.any?(fn(word) -> Regex.match?(~r/\b#{word}\b/i, aquote) end)
  end
end
