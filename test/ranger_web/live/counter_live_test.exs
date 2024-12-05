defmodule RangerWeb.CounterLiveTest do
  use RangerWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "user can increase counter", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view
    |> element("#increment")
    |> render_click()

    assert has_element?(view, "#count", "1")
  end

  test "user can increase counter (uses HTML)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    html =
      view
      |> element("#increment")
      |> render_click()

    assert html =~ "1"
  end

  test "user can increase counter (target event directly)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view |> render_click("increase")

    assert has_element?(view, "#count", "1")
  end

  test "debuggins liveview tests", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view |> open_browser()

    view
    |> element("#increment")
    |> render_click()

    view |> open_browser()

    assert has_element?(view, "#count", "1")
  end

  test "user can decrease counter", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view
    |> element("#decrement")
    |> render_click()

    assert has_element?(view, "#count", "-1")
  end

  test "user can decrease counter (uses HTML)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    html =
      view
      |> element("#increment")
      |> render_click()

    assert html =~ "-1"
  end

  test "user can decrease counter (target event directly)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")

    view |> render_click("decrease")

    assert has_element?(view, "#count", "-1")
  end
end
