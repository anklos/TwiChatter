class AddNicknameToOnlineusers < ActiveRecord::Migration
  def self.up
    add_column :onlineusers, :nickname, :string
  end

  def self.down
    remove_column :onlineusers, :nickname
  end
end
