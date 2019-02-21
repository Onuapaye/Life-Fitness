require "application_system_test_case"

class UserActivitiesTest < ApplicationSystemTestCase
  setup do
    @user_activity = user_activities(:one)
  end

  test "visiting the index" do
    visit user_activities_url
    assert_selector "h1", text: "User Activities"
  end

  test "creating a User activity" do
    visit user_activities_url
    click_on "New User Activity"

    click_on "Create User activity"

    assert_text "User activity was successfully created"
    click_on "Back"
  end

  test "updating a User activity" do
    visit user_activities_url
    click_on "Edit", match: :first

    click_on "Update User activity"

    assert_text "User activity was successfully updated"
    click_on "Back"
  end

  test "destroying a User activity" do
    visit user_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User activity was successfully destroyed"
  end
end
