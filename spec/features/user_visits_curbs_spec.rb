require 'rails_helper'

RSpec.feature "UserVisitsCurbs", type: :feature do
  it 'shows items on their curb' do
    user = create :user
    login_as user
    create :item, user_id: user.id

    visit curb_path

    expect(page).to have_css('h2', text: 'Items you are selling')
  end
end
