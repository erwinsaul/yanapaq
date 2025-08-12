defmodule YanapaqWeb.TestingSetupVerificationTest do
  use YanapaqWeb.ConnCase

  describe "verificación completa de setup de testing" do
    test "ConnCase funciona correctamente", %{conn: conn} do
      # Verificar que conn está disponible
      assert conn
      assert conn.assigns == %{}
    end

    test "MathHelpers funcionan correctamente" do
      # Verificar helpers de precision decimal (Decimal)
      decimal_a = Decimal.new("3.14159")
      decimal_b = Decimal.new("3.14160")
      assert_decimal_equal(decimal_a, decimal_b, 0.001)

      # Verificar helpers de float
      assert_float_equal(3.14159, 3.14160, 0.001)

      # Verificar generación de datasets
      dataset = generate_test_dataset(10, 0, 100)
      assert length(dataset) == 10
      Enum.each(dataset, fn value ->
        assert value >= 0
        assert value <= 100
      end)
    end

    test "generación de datos de regresión funciona" do
      # Verificar datos regresión lineales
      regression_data = generate_regression_dataset(5, 2, 1, 0.1)
      assert length(regression_data) == 5

      # Verificar estructura de datos 
      {x, y} = hd(regression_data)
      assert is_number(x)
      assert is_number(y)
    end

   #completar desde aqui 
end
