feature "Add new links" do
  scenario "See the added new link" do
    link = "https://www.gmail.com"
    visit "/"
    fill_in :new_link, with: link
    click_button "Save link"
    expect(page).to have_content link
  end
  scenario "Check if url is valid" do
    visit "/"
    fill_in :new_link, with: "url"
    click_button "Save link"
    expect(page).not_to have_content "url"
    expect(page).to have_content "This is not a link"
  end
end
