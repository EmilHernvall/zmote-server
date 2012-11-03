class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :post_id
      t.integer :channel_id
      t.date :duration
      t.date :starttime
      t.string :description
      t.string :shortdescription
      t.timestamps
    end
  end
end
