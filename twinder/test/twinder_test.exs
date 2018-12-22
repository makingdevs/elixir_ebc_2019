defmodule TwinderTest do
  use ExUnit.Case
  doctest Twinder

  test "greets the world" do
    assert Twinder.hello() == :world
  end
end
