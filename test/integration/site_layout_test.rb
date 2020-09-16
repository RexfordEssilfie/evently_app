require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 3
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", dynamic_path
  end

  test "layout titles" do
    get root_path
    assert_select "title", full_title()

    get contact_path
    assert_select "title", full_title("Contact")

    get help_path
    assert_select "title", full_title("Help")

    get about_path
    assert_select "title", full_title("About")

    get dynamic_path
    assert_select "title", full_title("Random Verse")

    get signup_path
    assert_select "title", full_title("Sign Up")
  end

end
