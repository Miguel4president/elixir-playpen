defmodule Servy.HandleFile do
  # Prefer the mutliclause function over case statements for this
  # Especially once I move it into a separate file.
  # Cleaner, you can alter code for a single branch and not have to mess with a big
  # case clause, or you can just add new function clauses, easy-mode
  def handle_file({:ok, content}, conv) do
    %{ conv | status: 200, resp_body: content }
  end

  def handle_file({:error, :enoent}, conv) do
    %{ conv | status: 404, resp_body: "File not found!" }
  end

  def handle_file({:error, reason}, conv) do
    %{ conv | status: 500, resp_body: "File error: #{reason}" }
  end

end
