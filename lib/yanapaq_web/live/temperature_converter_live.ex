defmodule YanapaqWeb.TemperatureConverterLive do
  use YanapaqWeb, :live_view
  def mount(_params, _session, socket) do
    {:ok, assign(socket, value: "", from_unit: "c", to_unit: "f", result: nil)}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-2xl mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 mb-6">
        Convertidor de Temperatura
      </h1>
      <div class="bg-white rounded-lg shadow p-6">
        <form phx-change="convert">
          <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700 mb-2">
              Valor
            </label>
            <input type="number" name="value" value={@value} step="any" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500" placeholder="Ej: 25"/>
          </div>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">
                De
              </label>
              <select name="from_unit" class="w-full px-4 py-2 border border-gray-300 rounded-lg">
                <option value="c" selected={@from_unit == "c"}>Celsius (ºC)</option>
                <option value="f" selected={@from_unit == "f"}>Fahrenheit (ºF)</option>
                <option value="k" selected={@from_unit == "k"}>Kelvin (K)</option>
              </select>
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">
                A
              </label>
              <select name="to_unit" class="w-full px-4 py-2 border border-gray-300 rounded-lg">
                <option value="c" selected={@to_unit == "c"}>Celsius (ºC)</option>
                <option value="f" selected={@to_unit == "f"}>Fahrenheit (ºF)</option>
                <option value="k" selected={@to_unit == "k"}>Kelvin (K)</option>
              </select>
            </div>
          </div>
          <%= if @result do %>
            <div class="mt-6 p-4 bg-orange-50 rounded-lg border border-orange-200">
              <p class="text-lg font-semibold text-orange-900">
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
    result = case Yanapaq.Converters.Temperature.convert(value, from, to) do
      {:ok, val} -> "#{val} º#{String.upcase(to)}"
      {:error, _} -> nil
    end
    {:noreply, assign(socket, value: value, from_unit: from, to_unit: to, result: result)}
  end
end
