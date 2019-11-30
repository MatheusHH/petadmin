class Discount < ApplicationRecord
  include Fae::BaseModelConcern
  enum kind: { percent: 0, value: 1 }

  validates :title, uniqueness: true, presence: true
  validates :value, presence: true

  def fae_display_field
    title
  end

end
