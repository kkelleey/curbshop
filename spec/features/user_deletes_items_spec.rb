require 'rails_helper'
require 'support/features/helpers'

RSpec.feature "UserDeletesItems", type: :feature do
  scenario 'item belongs to user' do
    user = create :user_with_item
    login_as user
    visit curb_path
    click_on 'Remove from curb'

    expect(page).to have_alert('Success! Your item has been removed from your curb')
  end
end
