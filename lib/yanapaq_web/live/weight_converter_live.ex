defmodule YanapaqWeb.WeightConverterLive do
  use YanapaqWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, value: "", from_unit: "kg", to_unit: "kg", result: nil)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-2xl mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 mb-2">Convertidor de Peso</h1>
      <p>Ingresa el valor que deseas convertir, selecciona la unidad de origen y la unidad destino.
         El resultado se calcula automáticamente.
      </p>
      <div class="bg-white rounded-lg shadow p-6">
        <form phx-change="convert" phx-submit="convert">
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700 mb-2">Valor</label>
            <input type="number" name="value" value={@value} step="any" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500" placeholder="Ingresa un valor" />
          </div>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">De</label>
              <select name="from_unit" class="w-full px-4 py-2 border border-gray-300 rounded-lg">
                <option value="kg" selected={@from_unit == "kg"}>Kilogramos (kg)</option>
                <option value="g" selected={@from_unit == "g"}>Gramos (g)</option>
                <option value="lb" selected={@from_unit == "lb"}>Libras (lb)</option>
                <option value="oz" selected={@from_unit == "oz"}>Onzas (oz)</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">A</label>
              <select name="to_unit" class="w-full px-4 py-2 border border-gray-300 rounded-lg">
                <option value="kg" selected={@to_unit == "kg"}>Kilogramos (kg)</option>
                <option value="g" selected={@to_unit == "g"}>Gramos (g)</option>
                <option value="lb" selected={@to_unit == "lb"}>Libras (lb)</option>
                <option value="oz" selected={@to_unit == "oz"}>Onzas (oz)</option>
            </div>
          </div>
          <%= if @result do %>
            <div class="mt-6 p-4 bg-blue-50 rounded-lg">
              <p class="text-lg font-semibold text-blue-900">
                Resultado: <%= @result %>
              </p>
            </div>
          <% end %>
        </form>
      </div>
    </div>
    """
  end

  def handle_event("convert", %{"value" => value, "from_unit" => from, "to_unit" => to}, socket) do
    result = calculate_weight(value, from, to)
    socket = assign(socket, value: value, from_unit: from, to_unit: to, result: result)
    {:noreply, socket}
  end

  defp calculate_weight("", _from, _to), do: nil
  defp calculate_weight(value, from, to) do
    case Float.parse(value) do
      {num, _} ->
        grams = to_grams(num, from)
        result = from_grams(grams, to)
        "#{Float.round(result, 4)} #{to}"
      :error -> nil
    end
  end

  # Convertir a gramos (unidad base)
  defp to_grams(value, "kg"), do: value * 1000
  defp to_grams(value, "g"), do: value
  defp to_grams(value, "lb"), do: value * 2.20462
  defp to_grams(value, "oz"), do: value * 35.274

  # Convertir de gramos a otras unidades
  defp from_grams(value, "kg"), do: value / 1000
  defp from_grams(value, "g"), do: value
  defp from_grams(value, "lb"), do: value / 2.20462
  defp from_grams(value, "oz"), do: value / 35.274
end
