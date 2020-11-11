class AddShipmentSourceIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :shipment_source_id, :integer, null: false
  end
end