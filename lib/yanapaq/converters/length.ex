defmodule Yanapaq.Converters.Length do
  @units ["m", "km", "ft", "in", "cm"]
  def units, do: @units

  def convert(value, from, to) when is_binary(value) do
    case Float.parse(value) do
      {num, _} -> convert(num, from, to)
      :error   -> {:error, :invalid_number}
    end
  end

  def convert(value, from, to) when is_number(value) do
    case to_meters(value, from) do
      {:error, _} = err -> err
      meters ->
        case from_meters(meters, to) do
          {:error, _} = err -> err
          result -> {:ok, Float.round(result * 1.0, 4)}
        end
    end
  end

  defp to_meters(v, "m"), do: v
  defp to_meters(v, "km"), do: v * 1000
  defp to_meters(v, "cm"), do: v / 100
  defp to_meters(v, "ft"), do: v * 0.3048
  defp to_meters(v, "in"), do: v * 0.0254
  defp to_meters(_, unit), do: {:error, {:unknown_unit, unit}}

  defp from_meters(v, "m"), do: v
  defp from_meters(v, "km"), do: v / 1000
  defp from_meters(v, "cm"), do: v * 100
  defp from_meters(v, "ft"), do: v / 0.3048
  defp from_meters(v, "in"), do: v / 0.0254
  defp from_meters(_, unit), do: {:error, {:unknown_unit, unit}}
end
