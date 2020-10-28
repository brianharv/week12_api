class CreateLocationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.column :city, :string
      t.column :country, :string
      t.timestamps()
    end
  end
end
