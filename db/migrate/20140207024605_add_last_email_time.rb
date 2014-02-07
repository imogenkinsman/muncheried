class AddLastEmailTime < ActiveRecord::Migration
  def change
    add_column :users, :emailed_at, :datetime
  end
end
