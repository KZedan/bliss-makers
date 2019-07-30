feature 'listing available spaces' do
  scenario 'the spaces are listed' do
    visit '/spaces'
    expect(page).to have_content 'Loft Space'
    # expect(page).to have_content 'Cool'
    # expect(page).to have_content '100'
  end
end
 
