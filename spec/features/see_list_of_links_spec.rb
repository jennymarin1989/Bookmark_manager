feature 'Viewing links' do
  scenario 'A user can see links' do
    visit('/')
    expect(page).to have_content "facebook"
  end
end

feature 'Wants to submit a new link' do
  scenario 'A user can go to the other page to add a link' do
    visit('/')
    click_button("Add new link")
    expect(page).to have_content("Add new links here!")
  end
end
