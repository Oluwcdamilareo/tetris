require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'layout_links' do
    get root_path
    assert_template 'static_pages/index'
    assert_select "a[href=?]", root_path, count:2
    assert_select "a[href=?]", store_path
    assert_select "a[href=?]", customercare_path

    get about_path
    assert_select "title", full_title("About")
  end
end
