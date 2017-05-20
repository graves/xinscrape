defmodule Xinscrape.Client do
  @moduledoc """
  Provide interface for common functionalities of the DigitalGangster API.
  """

  import Xinscrape.Base

  # filters
  @topics 4
  @replies 5

  @doc """
  Get the number of replies by a user
  """
  def reply_count(user_id, proxy \\ %{}) do
    request({:get, "u/#{user_id}/summary.json"}, proxy)
    |> Xinscrape.Parser.parse_reply_count
  end

  @doc """
  Get a segment of replies by the specified user
  """
  def replies(user_id, offset, proxy \\ %{}) do
    data = %{offset: offset, filters: @replies}
    request({:get, "user_actions.json?username=#{user_id}&offset=#{offset}&filter=#{@replies}"},  proxy)
    |> Xinscrape.Parser.parse_excerpts
  end

  @doc """
  Get a segment of topics by the specified user
  """
  def topics(user_id, offset, proxy \\ %{}) do
    data = %{offset: offset, filters: @replies}
    request({:get, "user_actions.json?username=#{user_id}&offset=#{offset}&filter=#{@topics}"}, proxy)
    |> Xinscrape.Parser.parse_excerpts
  end

  @doc """
  Get a segment of both replies and topics by the specified user
  """
  def all(user_id, offset, proxy \\ %{}) do
    data = %{offset: offset, filters: @replies}
    request({:get, "user_actions.json?username=#{user_id}&offset=#{offset}&filter=#{@topics},#{@replies}"}, proxy)
    |> Xinscrape.Parser.parse_excerpts
  end
end
