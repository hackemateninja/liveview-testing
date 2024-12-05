defmodule RangerWeb.NewsletterLiveTest do
  use RangerWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "Wanrs user of invalid email as user input", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/newsletter")

    invalid_email = "something"

    html =
      view
      |> form("#subscribe", %{subscription: %{email: invalid_email}})
      |> render_change()

    assert html =~ "has invalid format"
  end

  test "Warns user of invalid email as user types (directly event)", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/newsletter")

    invalid_email = "something"

    html =
      view
      |> render_change("validate", %{subscription: %{email: invalid_email}})

    assert html =~ "has invalid format"
  end
end
