feature "delete link" do
  scenario "delete the link when user clicks the button" do
    visit "/"
    click_button "delete link"
    fill_in :title, with: "google"
    click_button "delete"
    expect(page).not_to have_content "google"
  end
end
