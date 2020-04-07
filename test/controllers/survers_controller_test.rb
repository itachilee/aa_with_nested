require 'test_helper'

class SurversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surver = survers(:one)
  end

  test "should get index" do
    get survers_url
    assert_response :success
  end

  test "should get new" do
    get new_surver_url
    assert_response :success
  end

  test "should create surver" do
    assert_difference('Surver.count') do
      post survers_url, params: { surver: { name: @surver.name } }
    end

    assert_redirected_to surver_url(Surver.last)
  end

  test "should show surver" do
    get surver_url(@surver)
    assert_response :success
  end

  test "should get edit" do
    get edit_surver_url(@surver)
    assert_response :success
  end

  test "should update surver" do
    patch surver_url(@surver), params: { surver: { name: @surver.name } }
    assert_redirected_to surver_url(@surver)
  end

  test "should destroy surver" do
    assert_difference('Surver.count', -1) do
      delete surver_url(@surver)
    end

    assert_redirected_to survers_url
  end
end
