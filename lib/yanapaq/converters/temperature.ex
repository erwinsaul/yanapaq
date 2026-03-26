defmodule Yanapaq.Converters.Temperature do
  @units ["c", "f", "k"]

  def units, do: @units

  def convert(value, from, to) when is_binary(value) do
    case Float.parse(value) do
      {num, _} -> convert(num, from, to)
      :error   -> {:error, :invalid_number}
    end
  end

  def convert(value, from, to) when is_number(value) do
    case do_convert(value * 1.0, from, to) do
      {:error, _} = err -> err
      result -> {:ok, Float.round(result, 4)}
    end
  end

  defp do_convert(v, "c", "f"), do: v * 9 / 5 + 32
  defp do_convert(v, "c", "k"), do: v + 273.15
  defp do_convert(v, "f", "c"), do: (v - 32) * 5 / 9
  defp do_convert(v, "f", "k"), do: (v - 32) * 5 / 9 + 273.15
  defp do_convert(v, "k", "c"), do: v - 273.15
  defp do_convert(v, "k", "f"), do: (v - 273.15) * 9 / 5 + 32
  defp do_convert(v, same, same), do: v
  defp do_convert(_, from, to), do: {:error, {:unknown_unit, from, to}}
end
