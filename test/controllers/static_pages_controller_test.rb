require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Evently"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success 
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end


  test "should get dynamic random verse page" do
    get dynamic_path
    assert_response :success
    assert_select "title", "Random Verse | #{@base_title}"
  end

  test "should get dynamic verse" do
    (0...20).each do
      get dynamic_path
      assert_response :success
      assert_select ".verse", count: 1
      assert_select ".location", count: 1
    end
  end


  test "should get root" do
    get root_url
    assert_response :success
  end
end
