defmodule Servy.CompilerInfo do
  
  @moduledoc """
  This module just records things at compile time
  as module attributes and exposes the compiler info at 
  runtime.

  Just for messing with module attributes and seeing what
  system lvl info I have access to.
  """

  @compiler_info System.build_info()

  @compiler_env System.get_env()

  @compile_time System.os_time()

  def get do
    @compiler_info
  end

  def env do
    @compiler_env
  end

  def time do
    @compile_time
  end

end
