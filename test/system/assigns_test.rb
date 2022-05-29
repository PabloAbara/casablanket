require "application_system_test_case"

class AssignsTest < ApplicationSystemTestCase
  setup do
    @assign = assigns(:one)
  end

  test "visiting the index" do
    visit assigns_url
    assert_selector "h1", text: "Assigns"
  end

  test "creating a Assign" do
    visit assigns_url
    click_on "New Assign"

    fill_in "Block", with: @assign.block
    fill_in "Status", with: @assign.status
    click_on "Create Assign"

    assert_text "Assign was successfully created"
    click_on "Back"
  end

  test "updating a Assign" do
    visit assigns_url
    click_on "Edit", match: :first

    fill_in "Block", with: @assign.block
    fill_in "Status", with: @assign.status
    click_on "Update Assign"

    assert_text "Assign was successfully updated"
    click_on "Back"
  end

  test "destroying a Assign" do
    visit assigns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assign was successfully destroyed"
  end
end
