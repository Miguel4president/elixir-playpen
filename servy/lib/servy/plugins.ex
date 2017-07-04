defmodule Servy.Plugins do

  alias Servy.Conv

  @doc "Logs 404 requests"
  def track(%Conv{status: 404, path: path} = conv) do
    if Mix.env != :test do
      IO.puts "Warning: #{path} is on the loose!"
    end
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(%Conv{} = conv) do
    if Mix.env == :dev do
      IO.inspect conv
    end
    conv
  end

  def emojify(%Conv{status: 200, resp_body: body} = conv) do
    emojies = String.duplicate("🎉", 5)
    %{ conv | resp_body: 	"#{emojies}\r\n#{body}\r\n#{emojies}" }
  end

  def emojify(%Conv{} = conv), do: conv
end
