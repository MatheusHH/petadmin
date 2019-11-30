class Sell < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { finished: 0, canceled: 1 }

  belongs_to :discount
  belongs_to :client

  has_many :sell_products
  has_many :products, through: :sell_products, dependent: :destroy
 
  has_many :sell_services 
  has_many :services, through: :sell_services, dependent: :destroy

  validates :client, presence: true

  before_save :set_total
 
 
  def fae_display_field
    id
  end
 
  def self.for_fae_index
    order(:id)
  end

  private
 
  def set_total
    total = 0
    self.products.each {|p| total += p.price }
    self.services.each {|s| total += s.price }
 
    if self.discount.present?
      if self.discount.value?
        total -= self.discount.value
      else
        if self.discount.percent?
          total -= ((self.discount.value / 100.0) * total)
        end
      end
    end
 
    total = (total >= 0)? total : 0
    self.total = total
  end
 
 
end
