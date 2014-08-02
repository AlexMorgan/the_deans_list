class AddImageToGirls < ActiveRecord::Migration
  def self.up
    add_attachment :girls, :image
  end

  def self.down
    remove_attachment :girls, :image
  end
end
