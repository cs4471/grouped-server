class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :nickname
      t.string :status
      t.string :lat
      t.string :lng
      t.string :certainty

      t.timestamps
    end
  end
end
