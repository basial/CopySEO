require 'spec_helper'

describe 'managing categories by admin' do
  before(:each) do
    FactoryGirl.create(:admin)
    log_in("admin")
  end

  context 'adding new category' do
    it 'adds new category with valid data' do
      expect do
        visit '/categories'
        expect(page).to have_text 'Kategorie'
        click_link 'Dodaj nową kategorię'
        expect(page).to have_text 'Nowa kategoria'

        within('form#new_category') do
          fill_in 'category[title]', with: 'Awesome category!'
          fill_in 'category[description]', with: 'Very cool items to buy.'
          click_button 'Zapisz zmiany!'
        end
      end.to change {Category.count}.by(1)

      expect(page).to have_text 'Kategorie'
      expect(page).to have_text 'Awesome category'
      expect(page).to have_text 'Very cool items to buy.'
      expect(page).to have_text 'Nowa kategoria'
    end
  end

  context 'when category is present' do
    let!(:category) {FactoryGirl.create(:category)}

    context 'deleting category' do
      it 'deletes category', js: true do
        expect do
          visit '/categories'
          click_link 'Usuń'
          page.driver.browser.switch_to.alert.accept
          expect(page).not_to have_text 'Awesome category!'
        end.to change {Category.count}.by(-1)
      end
    end

    context 'editing category' do
      it 'edits category with valid data' do
        expect do
          edit_category
        end.to_not change {Category.count}

        expect(page).to have_text 'Not so awesome category'
      end
    end

    context 'showing category' do
      it 'shows category' do
        show_category
        expect(page).to have_text 'Awesome category'
        expect(page).to have_text 'Very cool items to buy.'
      end

      it 'shows previous category vesion' do
        with_versioning do
          expect {edit_category}.to change {Category.find(category.id).versions.count}.by(2)
        end
          show_category
          expect(page).to have_text 'Utworzono'
      end
    end

    context 'changing category version' do
      it 'reverts previous category' do
        with_versioning do
          edit_category
          show_category
          click_link "Przywróć"
          expect(page).to have_text 'Przywrócono wersję'
        end
      end
    end
  end
end

describe 'managing categories by user' do
  before(:each) do
    FactoryGirl.create(:user)
    log_in("user")
  end

  context 'editing category' do
    let!(:category) {FactoryGirl.create(:category)}
    it 'edits category' do
      edit_category
    end
  end

  context 'other category actions' do
    it 'is not able to add category' do
      visit '/categories'
      expect(page).to_not have_link 'Dodaj nową kategorię'
    end

    it 'is not able to delete category' do
      visit '/categories'
      expect(page).to_not have_link 'Usuń'
    end
  end
end