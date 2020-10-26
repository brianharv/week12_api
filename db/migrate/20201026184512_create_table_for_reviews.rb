class CreateTableForReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :username, :string
      t.column :body, :string
      t.column :rating, :integer
      t.column :country, :string
      t.column :city, :string
      
      t.timestamps()
    end
  end
end
