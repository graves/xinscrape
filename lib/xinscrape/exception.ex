defmodule Xinscrape.Error do
  defexception [:code, :message]
end

defmodule Xinscrape.NotFoundError do
  defexception [:code, :message]
end

defmodule Xinscrape.MatchNotFoundError do
  defexception [:code, :message]
end

defmodule Xinscrape.ProxyError do
  defexception [:message]
end
