class CreateClouds < ActiveRecord::Migration
  def change
    create_table :clouds do |t|
			t.text :name
      t.timestamps null: false
    end
  end
end
