require 'rails_helper'

RSpec.feature "UserDeletesItems", type: :feature do
  scenario 'item belongs to user' do
    user = create :user_with_item
    login_as user
    visit curb_path
    click_on 'Remove from curb'

    expect_page_to_have_alert('Success! Your item has been removed from your curb')
  end

  scenario 'item does not belong to user' do
    user = create :user
    login_as user
    item = create :item_with_user

    page.driver.submit :delete, item_path(item.id), {}

    expect_page_to_have_alert('You are not authorized to perform this action')
    expect(current_path).to eq(root_path)
  end

  private

  def expect_page_to_have_alert(text)
    expect(page).to have_css('.alert', text: text)
  end
end
