require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see My Cart number increases by 1" do
    # ACT
    visit root_path

    page.first('article.product').find_button('Add').click
    sleep 4

    puts page.html

    # DEBUG / VERIFY
    # save_and_open_screenshot
    save_screenshot

    # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end
