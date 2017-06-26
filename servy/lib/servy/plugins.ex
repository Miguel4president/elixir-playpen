defmodule Servy.Plugins do

  alias Servy.Conv

  @doc "Logs 404 requests"
  def track(%Conv{status: 404, path: path} = conv) do
    IO.puts "Warning: #{path} is on the loose!"
    conv
  end

  def track(%Conv{} = conv), do: conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%Conv{} = conv), do: conv

  def log(conv), do: IO.inspect conv

  def emojify(%Conv{status: 200, resp_body: body} = conv) do
    emojies = String.duplicate("🎉", 5)
    %{ conv | resp_body: 	"#{emojies} \n #{body} \n #{emojies}" }
  end

  def emojify(%Conv{} = conv), do: conv
end
