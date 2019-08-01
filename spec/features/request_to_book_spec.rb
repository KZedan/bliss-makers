feature 'request to book space' do
  scenario 'request to book space' do
    visit 'spaces/:id'
    click_button 'Request to Book'
    expect(page).to have_content 'Loft space'
    expect(page).to have_content 'Not confirmed'
  end
end
