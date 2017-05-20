defmodule Xinscrape.Model.Proxy do
  @moduledoc """
  Proxy object.
  """

  defstruct proxyType: "manual", ftpProxy: nil, httpProxy: nil, sslProxy: nil,
    socksProxy: nil, socksUsername: nil, socksPassword: nil

  @type t :: %__MODULE__{}

  def create(type, proxy) do
    case type do
      "ftp" ->
        struct(%__MODULE__{}, ftpProxy: proxy)
      "http" ->
        struct(%__MODULE__{}, httpProxy: proxy)
      "ssl" ->
        struct(%__MODULE__{}, sslProxy: proxy)
      "socks" ->
        struct(%__MODULE__{}, socksProxy: proxy)
      "all" ->
        struct(%__MODULE__{}, ftpProxy: proxy, httpProxy: proxy,
               sslProxy: proxy, socksProxy: proxy)
      _ ->
        raise Xinscrape.ProxyError,
          message: "Type must be ftp, http, ssl, socks, or all"
    end
  end

  def create(type, proxy, username, password) do
    case type do
      "socks" ->
        struct(%__MODULE__{}, socksProxy: proxy, socksUsername: username,
               socksPassword: password)
      "all" ->
        struct(%__MODULE__{}, ftpProxy: proxy, httpProxy: proxy,
               sslProxy: proxy, socksProxy: proxy, socksUsername: username,
               socksPassword: password)
      _ ->
        raise Xinscrape.ProxyError,
          message: "For authenticated proxies type must be socks or all"
    end
  end
end
