feature "Update link" do
  scenario "update the new link when user clicks the button" do
    visit '/'
    click_button "update"
    fill_in :title, with:"google"
    fill_in :new_title, with: "tweeter"
    fill_in :new_url, with: "http://www.tweeter.com"
    click_button "update link"
    expect(page).to have_content "tweeter"
  end
end
