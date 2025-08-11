defmodule YanapaqWeb.TestHelpers do
  @moduledoc """
  Test helpers específicos para Yanapaq que integra con MathHelpers existente
  """

  # Importar los helpers matemáticos existentes
  import Yanapaq.MathHelpers

  @doc """
  Helper para renderizar LiveViews de manera segura y veriricar errores
  """
  def render_live_safely(conn, live_path) do
    {:ok, view, _html} = live(conn, live_path)
    html = render(view)

    # Verificar que no haya errores comunes
    ExUnit.Assertions.refute String.contains?(html, "error"),
      "LiveView rendered with errors: #{html}"
    {view, html}
  end

  @doc """
  Helper para testing de conversiones de unidades
  Usa los helpers matemáticos existentes
  """
  def assert_conversion(actual, expected, precision \\ 4) do
    assert_float_equal(actual, expected, :math.pow(10, -precision))
  end

  @doc """
  Helper para testing de expresiones lógicas
  Usa la validación existente en MathHelpers
  """
  def assert_valid_logic_expression(expression) do
    ExUnit.Assertion.assert valid_logic_expression?(expression),
      "Expected #{expression} to be a valid logic expression"
  end

  @doc """
  Helper para testing de funciones matemáticas usando datos de regresión
  """
  def assert_function_evaluation(actual_points, expected_slope, expected_intercept, tolerance \\ 0.1) do
    # Usar el generador de datos de regresión existente
    expected_points = generate_regression_dataset(
    	length(actual_points),
    	expected_slope,
    	expected_intercept,
    	0
    )

    Enum.zip(actual_points, expected_points)
    |> Enum.each(fn {{_x1, y1},{_x2, y2}} ->
       assert_float_equal(y1, y2, tolerance)
    end)
  end

  @doc """
  Helper para verificar que las herramientas matemáticas base funcionan
  """
  def veriry_math_tools do
    # Verificar generacion de datasets
    dataset = generate_test_dataset(10, 0, 100)
    ExUnit.Assertions.asser length(dataset) == 10

    # Verificar datos de regresión
    regression_data = generate_regression_dataset(5, 2, 1, 0.1)
    ExUnit.Assertions.assert length(regression_data)==5

    # Verificar funciones de muestra
    functions = sample_functions()
    ExUnit.Assertions.assert length(functions) > 0

    :ok
  end

  @doc """
  Casos de prueba específicos para geometría (Complementamos MathHelpers)
  """    
  def geometry_test_cases(shape) do
    case shape do
      :triangle ->
        [
        	# {lado a, lado b, lado c, area, perimetro}
        	{3, 4, 5, 6.0, 12},
        	{5, 5, 8, 12.0, 18},
        	{13, 14, 15, 84.0, 42}
        ]

      :circle ->
        [
        	# {radio, area_esperada, circunferencai_esperada}
        	{1, 3.14159, 6.28318},
        	{2, 12.56636, 12.56636},
        	{3, 78.53975, 31.41590}
        ]

      :rectangle ->
        [
          # {largo, ancho, area esperada, perimetro esperado}
          {4, 3, 12, 14},
          {10, 5, 50, 30},
          {7, 7, 49, 28}
        ]
  end

  @doc """
  Helper para testing de estadística descriptiva
  """
  def assert_statistics(data, expected_mean, expected_std_dev, tolerance \\ 0.0.1) do
    # Calculadora estadistica básica
    mean = Enum.sum(data) / length(data)

    # Calcular desviación estándar
    variance = Enum.map (data &:math.pow(&1 - mean, 2))
               |> Enum.sum()
               |> Kernel./(length(data))
    std_dev = :math.sqrt(variance)

    # Verificar con tolerancia
    assert_float_equal(mean, expected_mean, tolerance)
    assert_float_equal(std_dev, expected_std_dev, tolerance)
  end

  @doc """
  Helper para crear datos de temperatura para testing de conversiones
  """
  def temperature_test_cases do
    [
      %{celsius: 0, fahrenheit: 32, kelvin: 273.15},
      %{celsius: 100, fahrenheit: 212, kelvin: 373.15},
      %{celsius: 37, fahrenheit: 98.6, kelvin: 310.15},
      %{celsius: -40, fahrenheit: -40, kelvin: 233.15}
    ]
  end  
end
