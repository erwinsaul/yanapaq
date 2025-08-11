defmodule YanapaqWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use YanapaqWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate
  require Phoenix.LiveViewTest
  using do
    quote do
      # The default endpoint for testing
      @endpoint YanapaqWeb.Endpoint

      use YanapaqWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import Phoenix.LiveViewTest
      import YanapaqWeb.ConnCase
      import Yanapaq.MathHelpers
    end
  end

  setup tags do
    Yanapaq.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  @doc """
  Helper para testing deLiveView con datos especificos
  """
  def live_isolated(conn, live_view, params \\ %{}, session \\ %{}) do
     Phoenix.LiveViewTest.live_isolated(conn, live_view,
       router: YanapaqWeb.Router,
       session: session,
       params: params
     )
  end

  @doc """
  Helper para crear usuarios de prueba (Para proximas implementaciones)
  """
  def create_user(_attrs \\ %{}) do
    #Placeholder para cuando implementos usuarios
    %{}
  end
end
