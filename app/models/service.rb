class Service < ApplicationRecord
  include Fae::BaseModelConcern
  has_fae_image :hero_image

  validates :title, uniqueness: true, presence: true
  validates :price, presence: true
  
  has_many :book_services
  has_many :books, through: :book_services

  def fae_display_field
    title
  end

end
