class AddLocationToRecords < ActiveRecord::Migration
  def change
    add_column :records, :location, :string
  end
end
