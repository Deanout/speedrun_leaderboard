require "test_helper"

class SpeedrunsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @speedrun = speedruns(:one)
  end

  test "should get index" do
    get speedruns_url
    assert_response :success
  end

  test "should get new" do
    get new_speedrun_url
    assert_response :success
  end

  test "should create speedrun" do
    assert_difference("Speedrun.count") do
      post speedruns_url, params: { speedrun: { category_id: @speedrun.category_id, time: @speedrun.time, user_id: @speedrun.user_id } }
    end

    assert_redirected_to speedrun_url(Speedrun.last)
  end

  test "should show speedrun" do
    get speedrun_url(@speedrun)
    assert_response :success
  end

  test "should get edit" do
    get edit_speedrun_url(@speedrun)
    assert_response :success
  end

  test "should update speedrun" do
    patch speedrun_url(@speedrun), params: { speedrun: { category_id: @speedrun.category_id, time: @speedrun.time, user_id: @speedrun.user_id } }
    assert_redirected_to speedrun_url(@speedrun)
  end

  test "should destroy speedrun" do
    assert_difference("Speedrun.count", -1) do
      delete speedrun_url(@speedrun)
    end

    assert_redirected_to speedruns_url
  end
end
