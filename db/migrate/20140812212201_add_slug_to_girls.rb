class AddSlugToGirls < ActiveRecord::Migration
  def change
    add_column :girls, :slug, :string
    add_index :girls, :slug, unique: true
  end
end
