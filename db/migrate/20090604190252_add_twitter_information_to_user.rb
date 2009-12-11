class AddTwitterInformationToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_uid, :string
    add_column :users, :avatar_url, :string
    add_column :users, :name, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :avatar_url
    remove_column :users, :twitter_uid
  end
end
