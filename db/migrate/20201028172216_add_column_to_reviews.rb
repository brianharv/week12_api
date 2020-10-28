class AddColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :location_id, :integer
    add_foreign_key :reviews, :locations
    remove_column :reviews, :city, :string
    remove_column :reviews, :country, :string
  end
end
