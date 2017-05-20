defmodule Xinscrape do
  @moduledoc """
  DigitalGangster API Client
  """

  @doc """
  Returns replies by the specified username within
  the provided offset. The endpoint provides 30
  user actions at a time.

  ## Examples

      iex> Xinscrape.replies("xintani", 0)
      ["hey i am so pretty", "i'm v smart too"]

  """
  defdelegate replies(user_id, offset), to: Xinscrape.Client

  @doc """
  Returns topics created by the specified username within
  the provided offset. The endpoint provides 30
  user actions at a time.

  ## Examples

  iex> Xinscrape.topics("xintani", 0)
  ["EVERYONE IS NOT AS GOOD AS ME", "Why Are You All So Bad At Things"]

  """
  defdelegate topics(user_id, offset), to: Xinscrape.Client

  @doc """
  Returns both replies and topics created by the specified username within
  the provided offset. The endpoint provides 30
  user actions at a time.

  ## Examples

  iex> Xinscrape.all("xintani", 0)
  ["i'm so smart and pretty", "Why Are You All So Bad At Things"]

  """
  defdelegate all(user_id, offset), to: Xinscrape.Client
end
