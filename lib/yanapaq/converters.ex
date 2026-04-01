defmodule Yanapaq.Converters do

  @categories [:length, :temperature, :weight, :volume]

  def categories, do: @categories

  def units_for(:length), do: Yanapaq.Converters.Length.units()
  def units_for(:temperature), do: Yanapaq.Converters.Temperature.units()
  def units_for(:weight), do: Yanapaq.Converters.Weight.units()
  def units_for(:volume), do: Yanapaq.Converters.Volume.units()

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

end
