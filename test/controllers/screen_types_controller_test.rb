require 'test_helper'

class ScreenTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screen_type = screen_types(:one)
  end

  test "should get index" do
    get screen_types_url
    assert_response :success
  end

  test "should get new" do
    get new_screen_type_url
    assert_response :success
  end

  test "should create screen_type" do
    assert_difference('ScreenType.count') do
      post screen_types_url, params: { screen_type: { doctor_id: @screen_type.doctor_id, title: @screen_type.title } }
    end

    assert_redirected_to screen_type_url(ScreenType.last)
  end

  test "should show screen_type" do
    get screen_type_url(@screen_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_screen_type_url(@screen_type)
    assert_response :success
  end

  test "should update screen_type" do
    patch screen_type_url(@screen_type), params: { screen_type: { doctor_id: @screen_type.doctor_id, title: @screen_type.title } }
    assert_redirected_to screen_type_url(@screen_type)
  end

  test "should destroy screen_type" do
    assert_difference('ScreenType.count', -1) do
      delete screen_type_url(@screen_type)
    end

    assert_redirected_to screen_types_url
  end
end
