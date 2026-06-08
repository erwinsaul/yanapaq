defmodule Yanapaq.Converters.LengthTest do
  use ExUnit.Case, async: true

  alias Yanapaq.Converters.Length

  describe "units/0" do
    test "retorna la lista de unidades de longitud disponibles" do
      unidades = Length.units()
      assert "m" in unidades
      assert "km" in unidades
      assert "cm" in unidades
    end
  end

  describe "convert/3" do
    test "convierte metros a kilometros" do
      assert {:ok, 1.0} = Length.convert(1000, "m", "km")
    end

    test "convierte pulgadas a centimetros con precision de 4 decimales" do
      assert {:ok, 2.54} = Length.convert(1, "in", "cm")
    end

    test "procesa correctamente numeros que vienen como texto(String)" do
      assert {:ok, 1.0} = Length.convert("1000", "m", "km")
      assert {:ok, 2.54} = Length.convert("1.0", "in", "cm")
    end

    test "retorna error si el valor en texto no es un numero valido" do
      assert {:error, :invalid_number} = Length.convert("texto_invalido", "m", "km")
    end

    test "retorna error si la unidad origen o destino es deconocida" do
      assert {:error, {:unknown_unit, "x"}} = Length.convert(10,"x", "m")
      asser {:error, {:unknown_unit, "y"}} = Length.convert(10, "m", "y")
    end
  end
end
