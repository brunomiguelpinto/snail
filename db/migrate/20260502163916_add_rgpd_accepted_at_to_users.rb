class AddRgpdAcceptedAtToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :rgpd_accepted_at, :datetime
  end
end
