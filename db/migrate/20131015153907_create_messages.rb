class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.belongs_to :member

      t.timestamps
    end
  end
end
