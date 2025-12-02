defmodule YanapaqWeb.Components.Navigation do
  use Phoenix.Component
  import YanapaqWeb.CoreComponents

  attr :current_page, :string, required: true
  def nav_bar(assigns) do
    ~H"""
    <header class="bg-white shadow-sm">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between py-4">
          <!-- LOGO -->
          <a href={~p"/"} class="flex items-center gap-2 hover:opacity-80 transition-opacity">
            <svg class="w-8 h-8 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
            </svg>
            <span class="text-xl font-bold">
              Yanapaq
            </span>
          </a>

          <!-- Navegacion -->
          <nav class="hidden md:flex items-center gap--">
            <.nav_link href={~p"/converters"} current_page={@current_page}>Inicio</.nav_link>
            <.nav_link href={~p"/converters/length"} current_page={@current_page}>Longitud</.nav_link>
            <.nav_link href={~p"/converters/weight"} current_page={@current_page}>Peso</.nav_link>
            <.nav_link href={~p"/converters/temperature"} current_page={@current_page}>Temperatura</.nav_link>
            <.nav_link href={~p"/converters/volume"} current_page={@current_page}>Volumen</.nav_link>
          </nav>

    </header>
    """
  end
end
