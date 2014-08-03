class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :year, null: false
      t.string :major
      t.string :month
      t.text :bio
      t.string :charity
      t.string :charity_url
      t.string :video_url

      t.timestamps
    end
  end
end
