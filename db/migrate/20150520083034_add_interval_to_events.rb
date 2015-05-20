class AddIntervalToEvents < ActiveRecord::Migration
  def change
    add_column :events, :interval, :integer, :null => :false
  end
end
