require 'rails_helper'

RSpec.describe 'Book management', type: :feature do
  before do
    visit new_book_path # Go to the "New Book" page
  end

  context 'when creating a book with additional attributes' do
    it 'fails to save without an author' do
      fill_in 'Title', with: 'Test Book'
      fill_in 'Author', with: '' # Leave author blank
      click_button 'Create Book'

      expect(page).to have_content("Author can't be blank")
    end

    it 'fails to save with an invalid price' do
      fill_in 'Title', with: 'Test Book'
      fill_in 'Author', with: 'Author Name'
      fill_in 'Price', with: 'invalid' # Invalid price
      click_button 'Create Book'

      expect(page).to have_content('Price is not a number')
    end

    it 'fails to save without a published date' do
      fill_in 'Title', with: 'Test Book'
      fill_in 'Author', with: 'Author Name'
      fill_in 'Price', with: '10.99'
      select 'Select Year', from: 'book_published_date_1i'
      select 'Select Month', from: 'book_published_date_2i'
      select 'Select Day', from: 'book_published_date_3i'      
      click_button 'Create Book'

      expect(page).to have_content("Published date can't be blank")
    end
  end
end
