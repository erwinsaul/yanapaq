defmodule YanapaqWeb.ConverterIndexLive do
  use YanapaqWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 mb-6">Convertidor de Unidades</h1>

      <p class="text-gray-600 mb-8">
        Seleccione el tipo de conversión que necesitas:
      </p>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Tarjeta Longitud -->
          <.link navigate={~p"/converters/length"} class="block p-6 bg-white rounded-lg shadow hover:shadow-lg transition-shadow">
            <div class="flex items-center gap-4">
              <div>
                <h2 class="text-xl font-semibold text-gray-900">Longitud</h2>
                <p class="text-gray-600">Metros, kilómetros, pies, pulgadas...</p>
              </div>
            </div>
          </.link>

        <!-- Tarjeta Peso -->
          <.link navigate={~p"/converters/weight"} class="block p-6 bg-white rounded-lg shadow hover:shadow-lg transition-shadow">
            <div class="flex items-center gap-4">
              <div>
                <h2 class="text-xl font-semibold text-gray-900">Peso</h2>
                <p class="text-gray-600">Gramos, kilogramos, libras, onzas...</p>
              </div>
            </div>
          </.link>
        <!-- Tarjeta temperatura -->
          <.link navigate={~p"/converters/temperature"} class="block p-6 bg-white rounded-lg shadow hover:shadow-lg transition-shadow">
            <div class="flex items-center gap-4">
              <div>
                <h2 class="text-xl font-semibold text-gray-900">Temperatura</h2>
                <p class="text-gray-600">Celsius, Fahrenheit, Kelvi...</p>
              </div>
            </div>
          </.link>

        <!-- Tarjeta Volumen -->
          <.link navigate={~p"/converters/volume"} class="block p-6 bg-white rounded-lg shadow hover:shadow-lg transition-shadow">
            <div class="flex items-center gap-4">
              <div>
                <h2 class="text-xl font-semibold text-gray-900">Volumen</h2>
                <p class="text-gray-600">Litros, mililitros, galones...</p>
              </div>
            </div>
          </.link>
      </div>
    </div>
    """
  end
end
