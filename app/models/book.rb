class Book < ApplicationRecord
  include Fae::BaseModelConcern
  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end

  belongs_to :client

  has_many :book_services
  has_many :services, through: :book_services

  after_save :send_data

  private

   def send_data
     BookJob.perform_now(self)
   end
end
