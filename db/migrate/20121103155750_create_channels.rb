class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :iconURL
      t.string :channelURL
      t.integer :program_id
      t.timestamps
    end
  end
end
