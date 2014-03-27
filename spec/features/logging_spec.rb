require 'spec_helper'

describe 'signing in and out' do
  before(:each) do
    FactoryGirl.create(:user)
  end

  context 'signing in' do
    it 'logs in with valid data' do
      log_in
      expect(page).to have_text 'Zostałeś zalogowany.'
    end

    it 'tries to log in with invalid data' do
      visit '/'
      within('form#new_user') do
          fill_in 'user[email]', with: 'email'
          fill_in 'user[password]', with: 'pass'
          click_button 'Zaloguj!'
      end
      expect(page).to have_text 'Błędny adres email lub hasło.'
    end
  end

  context 'logging out' do
    it 'logs out' do
      log_in
      click_link 'Wyloguj się'
      expect(page).to have_text 'Zostałeś wylogowany.'
    end
  end
end