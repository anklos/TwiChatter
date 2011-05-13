class CreateOnlineusers < ActiveRecord::Migration
  def self.up
    create_table :onlineusers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :onlineusers
  end
end
