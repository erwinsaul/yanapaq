defmodule YanapaqWeb.LengthConverterLiveTest do
  use YanapaqWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "Pagina del convertidor de Longitud" do
    test "renderiza correctamente y realiza una conversion", %{conn: conn} do
      {:ok, view, html} = live(conn, "/converters/length")
      assert html =~ "Convertidor de longitud"
      resultado_html =
        view
        |> form("form", %{
          "value" => "1000",
          "from" => "m",
          "to" => "km"
        |> render_change()
        })
        assert resultado_html =~ "Resultado: 1.0 km"
    end

    test "maneja inputs vacios sin colapsar", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/converters/length")

      html_vacio = view""
        |> form("form", %{"value" => "", "from_unit" => "m", "to_unit" => "m"})
        |> render_change()

      refute html_vacio =~ "Resultado:"
    end
  end
end
