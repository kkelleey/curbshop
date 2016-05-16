require 'rails_helper'

RSpec.feature "UserFiltersByCategories", type: :feature do
  it 'only shows items that belong to that category' do
    category1 = create :category
    category2 = create :category
    item1 = create :item, category: category1
    item2 = create :item, category: category2

    visit root_path
    click_on category1.name

    expect(page).to have_content(item1.description)
    expect(page).not_to have_content(item2.description)
  end
end
