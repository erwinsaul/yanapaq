defmodule YanapaqWeb.MobileMenuLive do
  use YanapaqWeb, :live_view
  def mount(params, _session, socket) do
    return_path = Map.get(params, "from", "/converters")

    {:ok, assign(socket, :return_path, return_path)}
  end

  def render(assigns) do
    ~H"""
    <div class="fixed inset-0 z-50 bg-gray-600 bg-opacity-75" phx-click="close">
      <div class="fixed inset-y-0 right-0 max-w-xs w-full bg-white shadow-xl">
        <!-- Header del Menú -->
          <div class="flex items-center justify-between p-4 border-b">
            <h2 class="text-lg font-semibold text-gray-900">Menú</h2>
            <button phx-click="close" class="p-2 text-gray-600 hover:text-gray-900">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <!-- Links del menú -->
          <nav class="flex flex-col p-4 space-y-2">
            <.link navigate={~p"/converters"} class="px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg">
            Inicio
            </.link>
            <.link navigate={~p"/converters/length"} class="px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg">
            Longitud
            </.link>
            <.link navigate={~p"/converters/weight"} class="px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg">
            Peso
            </.link>
            <.link navigate={~p"/converters/temperature"} class="px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg">
            Temperatura
            </.link>
            <.link navigate={~p"/converters/volume"} class="px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg">
            Volumen
            </.link>
          </nav>
      </div>
    </div>
    """
  end
  def handle_event("close", _params, socket) do
    {:noreply, push_navigate(socket, to: socket.assigns.return_path)}
  end
end
