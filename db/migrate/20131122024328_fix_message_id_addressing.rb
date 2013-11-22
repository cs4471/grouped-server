class FixMessageIdAddressing < ActiveRecord::Migration
  remove_column :messages, :group
end
