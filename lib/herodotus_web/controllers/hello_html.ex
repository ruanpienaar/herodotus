defmodule HerodotusWeb.HelloHTML do
  use HerodotusWeb, :html

  embed_templates "hello_html/*"
  # def index(assigns) do
  #   ~H"""
  #   Hello!
  #   """
  # end
end
