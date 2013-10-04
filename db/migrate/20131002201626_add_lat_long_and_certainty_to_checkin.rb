class AddLatLongAndCertaintyToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :lat, :text
    add_column :checkins, :lng, :text
    add_column :checkins, :status, :text
    add_column :checkins, :certainty, :text
    add_column :checkins, :timestamp, :text
  end
end
