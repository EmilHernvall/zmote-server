class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :timestamp
      t.text :content
      t.integer :user_id
      t.integer :program_id
      t.timestamps
    end

  end
end
