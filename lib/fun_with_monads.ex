defmodule FunWithMonads do
  # require so we can use its macros is_nothing/1 and is_something/1
  require Rustic.Maybe

  # # # example of a bad type spec
  @spec maybe_get_foo(problem? :: boolean) :: String.t() | nil
  def maybe_get_foo(return_nil?) do
    if return_nil? do
      nil
    else
      "foo"
    end
  end

  @spec example() :: number() | nil
  def example() do
    case maybe_get_foo(false) do
      nil -> nil
      val -> val
    end
  end

  # # # example of a stronger type spec

  @spec get_maybe_foo(return_nil? :: boolean) :: Maybe.t(binary())
  def get_maybe_foo(return_nil?) do
    if return_nil? === false do
      Rustic.Maybe.nothing()
    else
      Rustic.Maybe.some("foo")
    end
  end

  @spec better_example() :: Maybe.t(number())
  def better_example() do
    maybe = get_maybe_foo(false)
    cond do
      Rustic.Maybe.is_nothing(maybe) -> Maybe.nothing()
      Rustic.Maybe.is_some(maybe) -> maybe
    end
  end
end
