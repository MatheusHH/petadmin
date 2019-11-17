class CreateCampaignClients < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_clients do |t|
      t.references :campaign, foreign_key: true
      t.reference :client

      t.timestamps
    end
  end
end