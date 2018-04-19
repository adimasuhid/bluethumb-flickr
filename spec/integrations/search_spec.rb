require 'rails_helper'

feature 'User searches photos' do
  scenario 'with empty string' do
    visit root_path
    fill_in 'q', with: ''
    click_button 'Search'

    expect(page).to_not have_css('img')
    expect(page).to have_text('Start searching')
  end

  context 'with non-empty string' do
    scenario 'with results' do
      dummy_client = double(search: [double(source: 'http://test_url.jpg')])
      allow(PhotoClient).to receive(:new).and_return(dummy_client)

      visit root_path
      fill_in 'q', with: 'dog'
      click_button 'Search'

      expect(page).to have_css('img')
      expect(page).to_not have_text('Start searching')
      expect(page).to_not have_text('No results found')
    end

    scenario 'with no results' do
      dummy_client = double(search: [])
      allow(PhotoClient).to receive(:new).and_return(dummy_client)

      visit root_path
      fill_in 'q', with: '23904850498539840932340'
      click_button 'Search'

      expect(page).to_not have_css('img')
      expect(page).to_not have_text('Start searching')
      expect(page).to have_text('No results found')
    end
  end
end
