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
      use_dummy_client(results: [double(source: 'http://test_url.jpg')])

      visit root_path
      fill_in 'q', with: 'dog'
      click_button 'Search'

      expect(page).to have_css('img')
      expect(page).to_not have_text('Start searching')
      expect(page).to_not have_text('No results found')
    end

    scenario 'with no results' do
      use_dummy_client
      visit root_path
      fill_in 'q', with: '23904850498539840932340'
      click_button 'Search'

      expect(page).to_not have_css('img')
      expect(page).to_not have_text('Start searching')
      expect(page).to have_text('No results found')
    end

    scenario 'with failed connection to client API' do
      use_dummy_client(success: false)
      visit root_path
      fill_in 'q', with: '23904850498539840932340'
      click_button 'Search'

      expect(page).to_not have_css('img')
      expect(page).to have_text('No results found')
      expect(page).to have_text('Search failed to connect')
    end
  end

  def use_dummy_client(results: [], success: true)
    dummy_client = double(search: results, last_request_success?: success)
    allow(PhotoClient).to receive(:new).and_return(dummy_client)
  end
end
