class AddMessageIdToGroup < ActiveRecord::Migration
  def change
    change_table :groups do |t|
      t.belongs_to :message
    end
  end
end
