defmodule Yanapaq.Converters.Weight do
  @units ["kg", "g", "lb", "oz"]

  def units, do: @units

  def convert(value, from, to) when is_binary(value) do
    case Float.parse(value) do
      {num, _} -> convert(num, from, to)
      :error   -> {:error, :invalid_number}
    end
  end

  def convert(value, from, to) when is_number(value) do
    case to_grams(value, from) do
      {:error, _} = err -> err
      grams ->
        case from_grams(grams, to) do
          {:error, _} = err -> err
          result -> {:ok, Float.round(result * 1.0, 4)}
        end
    end
  end

  defp to_grams(v, "kg"), do: v * 1000
  defp to_grams(v, "g"), do: v
  defp to_grams(v, "lb"), do: v * 453.592
  defp to_grams(v, "oz"), do: v * 28.3495
  defp to_grams(_, unit), do: {:error, {:unknown_unit, unit}}

  defp from_grams(v, "kg"), do: v / 1000
  defp from_grams(v, "g"), do: v
  defp from_grams(v, "lb"), do: v / 453.592
  defp from_grams(v, "oz"), do: v / 28.3495
  defp from_grams(_, unit), do: {:error, {:unknown_unit, unit}}
end
