defmodule YanapaqWeb.Components.Navigation do
  use Phoenix.Component
  import YanapaqWeb.CoreComponents

  attr :current_path, :string, required: true
  def nav_bar(assigns) do
    ~H"""
    <header class="bg-white shadow-sm">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between py-4">
          <!-- LOGO -->
          <a href={~p"/"} class="flex items-center gap-2 hover:opacity-80 transition-opacity">
            <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
            </svg>
            <span class="text-xl font-bold">
              Yanapaq
            </span>
          </a>

          <!-- Navegacion -->
          <nav class="hidden md:flex items-center gap-6">
            <.nav_link href={~p"/converters"} current_page={@current_path}>Inicio</.nav_link>
            <.nav_link href={~p"/converters/length"} current_page={@current_path}>Longitud</.nav_link>
            <.nav_link href={~p"/converters/weight"} current_page={@current_path}>Peso</.nav_link>
            <.nav_link href={~p"/converters/temperature"} current_page={@current_path}>Temperatura</.nav_link>
            <.nav_link href={~p"/converters/volume"} current_page={@current_path}>Volumen</.nav_link>
          </nav>

          <!-- Botón Menú Móvil -->
          <.link patch={~p"/menu"} class="md:hidden p-2 text-gray-600 hover:text-blue-600">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </.link>
        </div>
      </div>
    </header>
    """
  end
  # Componente para cada link del menú
  attr :href, :string, required: true
  attr :current_path, :string, required: true
  slot :inner_block, required: true
  def nav_link(assigns) do
    assigns  = assigns(assigns, :active, String.starts_with?(assigns.current_path, assigns.href))
    ~H"""
    <.link navigate={@href} class={["transition-colors font-medium pb-1",
      if @active do
        "text-blue-600 border-b-2 border-blue-600"
      else
        "text-gray-600 hover:text-blue-600"
      end
    ]}
    >
      <%= render_slot(@inner_block) %>
    </.link>
    """
  end

end
