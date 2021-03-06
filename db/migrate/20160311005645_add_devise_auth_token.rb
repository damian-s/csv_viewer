class AddDeviseAuthToken < ActiveRecord::Migration[5.0]
  
  def self.up
    change_table :users do |t|
      t.string :authentication_token
    end

    add_index  :users, :authentication_token, :unique => true
    User.all.each(&:save)

    
  end

  def self.down
    remove_column :users, :authentication_token
  end

end
