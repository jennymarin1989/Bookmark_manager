feature "Add new links" do
  scenario "See the added new link" do
    link = "https://www.gmail.com"
    visit "/"
    click_button "Add new link"
    fill_in :new_link, with: link
    fill_in :title, with: "gmail"
    click_button "Save link"
    expect(page).to have_content "gmail"
  end
  scenario "Check if url is valid" do
    visit "/"
    click_button "Add new link"
    fill_in :new_link, with: "url"
    click_button "Save link"
    expect(page).not_to have_content "url"
    expect(page).to have_content "You must submit a valid URL."
  end
end
