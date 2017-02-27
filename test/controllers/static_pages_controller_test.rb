require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Tetris"
  end

  test "should get index" do
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get store" do
    get store_path
    assert_response :success
    assert_select "title", "Store|#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About|#{@base_title}"
  end

  test "should get customer_care" do
    get customercare_path
    assert_response :success
    assert_select "title", "Customer Care|#{@base_title}"
  end
end
