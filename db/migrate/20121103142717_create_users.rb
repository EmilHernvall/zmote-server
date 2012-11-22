class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :starttime
      t.string :program_name
      t.string :channel_name
      t.timestamps
    end
  end
end
