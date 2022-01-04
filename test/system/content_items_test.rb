require "application_system_test_case"

class ContentItemsTest < ApplicationSystemTestCase
  setup do
    @content_item = content_items(:one)
  end

  test "visiting the index" do
    visit content_items_url
    assert_selector "h1", text: "Content Items"
  end

  test "creating a Content item" do
    visit content_items_url
    click_on "New Content Item"

    fill_in "Content title", with: @content_item.content_title
    fill_in "Publish date", with: @content_item.publish_date
    fill_in "Publishing target", with: @content_item.publishing_target
    click_on "Create Content item"

    assert_text "Content item was successfully created"
    click_on "Back"
  end

  test "updating a Content item" do
    visit content_items_url
    click_on "Edit", match: :first

    fill_in "Content title", with: @content_item.content_title
    fill_in "Publish date", with: @content_item.publish_date
    fill_in "Publishing target", with: @content_item.publishing_target
    click_on "Update Content item"

    assert_text "Content item was successfully updated"
    click_on "Back"
  end

  test "destroying a Content item" do
    visit content_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content item was successfully destroyed"
  end
end
