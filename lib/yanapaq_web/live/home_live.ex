defmodule YanapaqWeb.HomeLive do
  use YanapaqWeb, :live_view
  def mount(_params, _session, socket) do
    categories = [
      %{
        title: "Convertidores",
        description: "Convertidor de unidades de medida",
        path: ~p"/converters",
        tools: [
          %{name: "longitud", path: ~p"/converters/length", desc: "m, km, ft, in"},
          %{name: "peso", path: ~p"/converters/weight", desc: "kg, lb, oz"},
          %{name: "temperatura", path: ~p"/converters/temperature", desc: "°C, °F, °K"},
          %{name: "volumen", path: ~p"/converters/volume", desc: "L, mL, gal"}
        ]
      }
    ]
    {:ok, assign(socket, categories: categories)}
  end
  def render(assigns) do
    ~H"""
    <div class="max-w-5xl mx-auto">
      <div class="mb-10">
         <h1 class="text-4xl font-bold text-gray-900">Yanapaq</h1>
      </div>

      <div class="space-y-10">
        <div :for={category <- @categories}>
          <div class="flex items-center justify-between">
            <h2 class="text-2xl font-semibold text-gray-800">
              <%= category.title %>
            </h2>
            <.link navigate={category.path} class="text-sm text-blue-600 hover:underline">
              Ver todos
            </.link>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mt-4">
            <.tool_card
              :for={tool <- category.tools}
              name={tool.name}
              path={tool.path}
              desc={tool.desc}
            />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
