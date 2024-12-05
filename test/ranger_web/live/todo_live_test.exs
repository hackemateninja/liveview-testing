defmodule RangerWeb.TodoLiveTest do
  use RangerWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "user can creeate a new todo", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    view
    |> form("#add-todo", %{todo: %{body: "Form fellowship"}})
    |> render_submit()

    assert has_element?(view, "[data-role=todo]", "Form fellowship")
  end

  test "user can create a new todo (target event directly)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    view |> render_submit("create", %{todo: %{body: "Form fellowship"}})

    assert has_element?(view, "[data-role=todo]", "Form fellowship")
  end

  test "user can create a new todo (width HTML)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/todo")

    html =
      view
      |> form("#add-todo", %{todo: %{body: "Form fellowship"}})
      |> render_submit()

    assert html =~ "Form fellowship"
  end
end
