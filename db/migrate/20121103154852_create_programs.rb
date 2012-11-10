class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.integer :channel_id
      t.time :duration
      t.datetime :starttime
      t.string :description
      t.string :shortdescription
      t.timestamps
    end
  end
end
