require 'rails_helper'
require 'support/features/helpers'

RSpec.feature "UserUpdatesItems", type: :feature do
  scenario 'item belongs to user' do
    user = create :user_with_item
    login_as user
    visit curb_path
    click_on 'Edit'
    fill_in 'Description', with: 'New description'
    click_button 'Update Item'

    expect(page).to have_alert('Success! Your item has been updated.')
    expect(page).to have_content('New description')
  end

  scenario 'item does not belong to user' do
    user = create :user
    login_as user
    item = create :item_with_user
    visit edit_item_path(item)

    expect(page).to have_alert('You are not authorized to perform this action')
    expect(current_path).to eq(root_path)
  end
end
