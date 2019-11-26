class BookService < ApplicationRecord
  belongs_to :book
  belongs_to :service
end
