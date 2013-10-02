class AddLatLongAndCertaintyToGps < ActiveRecord::Migration
  def change
    add_column :gps_checkins, :lat, :text
    add_column :gps_checkins, :lng, :text
    add_column :gps_checkins, :certainty, :text
    add_column :gps_checkins, :timestamp, :text
  end
end
