defmodule Yanapaq.Converters do

  @categories [:length, :temperature, :weight, :volume]

  def categories, do: @categories

  def units_for(:length), do: {:ok, Yanapaq.Converters.Length.units()}
  def units_for(:temperature), do: {:ok, Yanapaq.Converters.Temperature.units()}
  def units_for(:weight), do: {:ok, Yanapaq.Converters.Weight.units()}
  def units_for(:volume), do: {:ok, Yanapaq.Converters.Volume.units()}
  def units_for(category), do: {:error, {:unknown_category, category}}

  def convert(:length, value, from, to) do
    Yanapaq.Converters.Length.convert(value, from, to)
  end

  def convert(:temperature, value, from, to) do
    Yanapaq.Converters.Temperature.convert(value, from, to)
  end

  def convert(:weight, value, from, to) do
    Yanapaq.Converters.Weight.convert(value, from, to)
  end

  def convert(:volume, value, from, to) do
    Yanapaq.Converters.Volume.convert(value, from, to)
  end

  def convert(category, _value, _from, _to), do: {:error, {:unknown_category, category}}

end
