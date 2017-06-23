defmodule Servy do
  def hello do
    :world
  end

  def hello(name) do
    "Yo, #{name}"
  end

  def reload? do
    "Yeah np dude, in iex just run the command > r Servy"
  end
end
