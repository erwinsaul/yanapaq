ExUnit.start()
# Configurar Ecto para testing
Ecto.Adapters.SQL.Sandbox.mode(Yanapaq.Repo, :manual)

#Configurar seed para números aleatorios consistentes en tests

:rand.seed(:exsss, {1, 2, 3})

#Configurar timeout para tests que pueda ser mas lentos
ExUnit.configure(timeout: 10_000)

#Aliases para imports comunes en tests
defmodule TestHelpers do
  @moduledoc """
  Helpers globales para todos los test
  """

  def assert_in_delta(actual, expected, delta) do
    ExUnit.Assertions.assert abs(actual - expected) <= delta,
      "Expected #{actual} to be within #{delta} of #{expected}"
  end

  def refute_in_delta(actual, expected, delta) do
    ExUnit.Assertions.refute abs(actual - expected) <= delta,
      "Expected #{actual} to NOT be within #{delta} of #{expected}"
  end
end
