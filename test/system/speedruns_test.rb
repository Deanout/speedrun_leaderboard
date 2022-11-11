require "application_system_test_case"

class SpeedrunsTest < ApplicationSystemTestCase
  setup do
    @speedrun = speedruns(:one)
  end

  test "visiting the index" do
    visit speedruns_url
    assert_selector "h1", text: "Speedruns"
  end

  test "should create speedrun" do
    visit speedruns_url
    click_on "New speedrun"

    fill_in "Category", with: @speedrun.category_id
    fill_in "Time", with: @speedrun.time
    fill_in "User", with: @speedrun.user_id
    click_on "Create Speedrun"

    assert_text "Speedrun was successfully created"
    click_on "Back"
  end

  test "should update Speedrun" do
    visit speedrun_url(@speedrun)
    click_on "Edit this speedrun", match: :first

    fill_in "Category", with: @speedrun.category_id
    fill_in "Time", with: @speedrun.time
    fill_in "User", with: @speedrun.user_id
    click_on "Update Speedrun"

    assert_text "Speedrun was successfully updated"
    click_on "Back"
  end

  test "should destroy Speedrun" do
    visit speedrun_url(@speedrun)
    click_on "Destroy this speedrun", match: :first

    assert_text "Speedrun was successfully destroyed"
  end
end
