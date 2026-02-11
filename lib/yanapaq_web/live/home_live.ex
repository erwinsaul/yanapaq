defmodule YanapaqWeb.HomeLive do
  use YanapaqWeb, :live_view
  def mount(_params, _session, socket) do
    tools = [
      %{
        title: "Convertidores",
        description: "Convertidor de unidades de medida",
        path: ~p"/converters",
        icon: "calculator"
      }
    ]
    {:ok, assign(socket, tools: tools)}
  end
  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto">
      <h1 class="text-3xl font-bold text-gray-900 mb-2">Yanapaq</h1>
      <p class="text-gray-600 mb-8">Tu caja de herramientas. Selecciona una categoría:</p>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <.link :for={tool <- @tools} navigate={tool.path} class="block p-6 bg-white rounded-lg shadow hover_shadow-lg transition-shadow">
          <h2 class="text-xl font-semibold text-gray-900"><%= tool.title%></h2>
          <p class="text-gray-600 mt-2"><%= tool.description %></p>
        </.link>
      </div>
    </div>
    """
  end
end
