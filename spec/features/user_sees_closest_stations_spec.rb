require "rails_helper"

RSpec.feature "User sees closest stations" do
  scenario "they find 10 closest stations by zip code" do
    visit root_path

    fill_in "q", with: "80203"
    click_on "Locate"

    expect(current_path).to eq("/search?zip=80203")
    #I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content("Electric")
    expect(page).to have_content("Propane")
    #refute some other type of power?
    within(".station").each do
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
    end
  end
end
