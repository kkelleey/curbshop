require 'rails_helper'

RSpec.feature "UserDeletesItems", type: :feature do
  scenario 'item belongs to user' do
    user = create :user
    login_as user
    user.items << create(:item)
    visit curb_path
    click_on 'Remove from curb'

    expect(page).to have_css(
      '.alert', text: 'Success! Your item has been removed from your curb'
    )
  end

  scenario 'item does not belong to user' do
    user = create :user
    login_as user
    other_user = create :user
    item = create(:item, user_id: other_user.id)

    page.driver.submit :delete, item_path(item.id), {}

    expect(page).to have_css(
      '.alert', text: 'You are not authorized to perform this action'
    )
    expect(current_path).to eq(root_path)
  end
end
