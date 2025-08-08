defmodule Yanapaq.MathHelpers do
  @moduledoc """
  Helpers específicos para testing de funcionalidades matemáticas
  """

  @doc """
  Compara números decimales con tolerancia para precision
  """
  def assert_decimal_equal(actual, expected, tolerance \\ 0.0001) do
    diff = abs(Decimal.to_float(Decimal.sub(actual, expected)))
    assert diff < tolerance,
      "Expected #{actual} to be within #{tolerance} of #{expected}, but difference was #{diff}"
  end

  @doc """
  Compara números flotantes con tolerancia.
  """
  def assert_float_equal(actual, expected, tolerance \\ 0.0001) do
    diff = abs(actual - expected)
    assert diff < tolerance,
      "Expected #{actual} to be within #{tolerance} of #{expected}, but difference was #{diff}"
  end

  @doc """
  Helper para generar datasets de prueba
  """
  def generate_test_dataset(size, min \\ 0, max \\ 100) do
    1..size
    |> Enum.map (fn _ ->
      :rand.uniform() * (max - min)+ min
    end)
  end

  @doc """
  Helper para generar pares de datos (X, Y) para regresión.
  """
  def generate_regression_dataset(size, slope \\ 1, intercept \\ 0, noise \\ 0.1) do
    1..size
    |> Enum.map(fn i ->
      x = i / size * 10
      y = slope * x + intercept + (:rand.uniform() - 0.5) * noise
      {x, y}      
    end)
  end

  @doc """
  Valida que una expresión lógica sea válida
  """
  def valid_logic_expression?(expression) when is_binary(expression) do
    # Simple validation - será mejorada cuando se implemnete el parser
    String.match?(expression, ~r/^[A-Z&|!()^-> ]+$/)
  end

  @doc """
  Helper para crear funciones matemáticas de prueba.
  """
  def sample_functions do
  	[
  	  "x^2",
  	  "sin(x)",
  	  "log(x)",
  	  "x^3 - 2*x + 1",
  	  "exp(x)",
  	  "sqrt(x)"  		
  	]
  end  
end  
