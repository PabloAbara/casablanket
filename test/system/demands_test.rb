require "application_system_test_case"

class DemandsTest < ApplicationSystemTestCase
  setup do
    @demand = demands(:one)
  end

  test "visiting the index" do
    visit demands_url
    assert_selector "h1", text: "Demands"
  end

  test "creating a Demand" do
    visit demands_url
    click_on "New Demand"

    fill_in "Direction", with: @demand.direction
    fill_in "Message", with: @demand.message
    fill_in "Offer", with: @demand.offer_id
    fill_in "Response assign", with: @demand.response_assign_id
    fill_in "Status", with: @demand.status
    click_on "Create Demand"

    assert_text "Demand was successfully created"
    click_on "Back"
  end

  test "updating a Demand" do
    visit demands_url
    click_on "Edit", match: :first

    fill_in "Direction", with: @demand.direction
    fill_in "Message", with: @demand.message
    fill_in "Offer", with: @demand.offer_id
    fill_in "Response assign", with: @demand.response_assign_id
    fill_in "Status", with: @demand.status
    click_on "Update Demand"

    assert_text "Demand was successfully updated"
    click_on "Back"
  end

  test "destroying a Demand" do
    visit demands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Demand was successfully destroyed"
  end
end
