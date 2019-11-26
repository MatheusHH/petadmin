class Address < ApplicationRecord
  include Fae::BaseModelConcern
  def fae_display_field
    id
  end

   def self.for_fae_index
     order(:id)
   end

  belongs_to :client


end
