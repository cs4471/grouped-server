class CreateGpsCheckins < ActiveRecord::Migration
  def change
    create_table :gps_checkins do |t|

      t.timestamps
    end
  end
end
