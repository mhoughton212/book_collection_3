require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations' do
    it 'is valid with a non-empty title' do
      book = Book.new(
        title: 'Some Title',
        author: 'Some Author',
        price: 9.99,
        published_date: Date.today)
      expect(book).to be_valid
    end

    it 'is invalid without a title' do
      book = Book.new(title: '')
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without an author' do
        book = Book.new(title: 'Book Title', author: '')
        expect(book).not_to be_valid
        expect(book.errors[:author]).to include("can't be blank")
    end

    it 'is invalid with a non-numeric price' do
        book = Book.new(title: 'Book Title', price: 'not-a-number')
        expect(book).not_to be_valid
        expect(book.errors[:price]).to include('is not a number')
    end

    it 'is invalid without a published date' do
        book = Book.new(title: 'Book Title', published_date: nil)
        expect(book).not_to be_valid
        expect(book.errors[:published_date]).to include("can't be blank")
    end
  end
end
