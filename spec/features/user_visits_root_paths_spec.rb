require 'rails_helper'

RSpec.feature "UserVisitsRootPath", type: :feature do
  scenario 'user visits root path' do
    # smoke test
    visit root_path

    expect(page).to have_content('CurbShop')
  end
end
