class PopulateUsernameForExistingUsers < ActiveRecord::Migration[7.1]
  def up
    User.find_each do |user|
      user.update!(username: user.email.split('@').first)
    end
  end
end
