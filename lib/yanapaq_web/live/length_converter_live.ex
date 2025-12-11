defmodule YanapaqWeb.LengthConverterLive do
  def mount(_params, _session, socket) do
    socket = assign(socket, value: "", from_unit: "m")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="ma-w-2xl mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 mb-6">Convertidor de Longitud</h1>
      <div class="bg-white rounded-lg shadow p-6">
        <form phx-change="convert" phx-submit="convert">
          <!-- Valor de de Entrada -->
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700 mb-2">Valor</label>
            <input type="number" name="value" value={@value} step="any" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500" placeholder="Ingresa un Valor"/>
          </div>

          <!-- Unidad Origen -->
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">De</label>
            <select name="from_unit" class="w-full px-4 py-2 border border-gray-300 rounded-lg">
              <option value="m" selected={@from_unit == "m"}>Metros (m) </option>
              <option value="km" selected={@from_unit == "km"}>Kilómetros (km)</option>
              <option value="cm" selected={@from_unit == "cm"}>Centímetros (cm) </option>
              <option value="ft" selected={@from_unit == "ft"}> Pies (ft) </option>
              <option value="in" selected={@from_unit == "in"}>Pulgadas (in) </option>
            </select>
          </div>
          <!-- Unidad Destino -->
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-2">A</label>
            <select name="to_unit" class="w-full px-4 py-2 border border-gray-300 rounded-lg">
              <option value="m" selected={@to_unit == "m"}>Metros (m)</option>
              <option value="km" selected={@to_unit == "km"}>Kilometros (km)</option>
              <option value="cm" selected={@to_unit == "cm"}">Centímetros (cm)</option>
              <option value="ft" selected={@to_unit == "ft"}>Pies (ft)</option>
              <option value="in" selected={@to_unit == "in"}>Pulgadas (in)</option>
            </select>
          </div>

          <!-- Resultado -->
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

  def handle_event("convert", %{"value" => value,"from_unit" => from, "to_unit" => to}, socket) do
    result = calculate_length(avlue, from, to)
    socket = assign(socket, value: value, from_unit: from, to_unit: to, result: result)
    {:noreply, socket}
  end

  defp calculate_length("", _from, _to), do: nil
  defp calulate_length(value, from, to) do
    case Float.parse(value) do
      {num, _} ->
        # Convertir todo a metros primero
        meters = to_meters(num, from)
        result = from_meters(meters, to)
        "#{Float.round(result, 4)} #{to}"
      :error -> nil
    end
  end

  # Convertir a metros
  defp to_meters(value, "m"), do: value
  defp to_meters(value, "km"), do: value * 1000
  defp to meters(value, "cm"), do: value / 100
  defp to_meters(value, "ft"), do: value * 0.3048
  defp to_meters(value, "in"), do: value * 0.0254

  # Convertir de metros a otras unidades
  defp from_meters(value, "m"), do: value
  defp from_meters(value, "km"), do: value / 1000
  defp from_meters(value, "cm"), do: value * 100
  defp from_meters(value, "ft"), do: value / 0.348
  defp from_meters(value, "in"), do: value / 0.0254

end
