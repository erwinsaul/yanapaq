defmodule Yanapaq.Converters.Volume do
  @units ["l", "ml", "gal"]

  def units, do: @units

  def convert(value, from, to) when is_binary(value) do
    case Float.parse(value) do
      {num, _} -> convert(num, from, to)
      :error   -> {:error, :invalid_number}
    end
  end

  def convert(value, from, to) when is_number(value) do
    case to_liters(value, from) do
      {:error, _} = err -> err
      liters ->
        case from_liters(liters, to) do
          {:error, _} = err -> err
          result -> {:ok, Float.round(result * 1.0, 4)}
        end
    end
  end

  defp to_liters(v, "l"), do: v
  defp to_liters(v, "ml"), do: v/1000
  defp to_liters(v, "gal"), do: v*3.78541
  defp to_liters(_, unit), do: {:error, {:unknown_unit, unit}}

  defp from_liters(v, "l"), do: v
  defp from_liters(v, "ml"), do: v*1000
  defp from_liters(v, "gal"), do: v/3.78541
  defp from_liters(_, unit), do: {:error, {:unknown_unit, unit}}

end
