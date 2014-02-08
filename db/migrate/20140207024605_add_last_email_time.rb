class AddLastEmailTime < ActiveRecord::Migration
  def change
    add_column :users, :emailed_at, :datetime, default: 2.days.ago
  end
end
