class AddGroupIdToMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.belongs_to :group
    end
    remove_column :groups, :message_id
  end
end
