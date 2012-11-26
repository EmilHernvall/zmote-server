class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.integer :program_id
      t.datetime :starttime
      t.string :program_name
      t.string :channel_name
      t.string :username
      t.timestamps
    end

  end
end
