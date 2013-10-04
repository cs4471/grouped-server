class AddMemberIdToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :member_id, :integer
  end
end
