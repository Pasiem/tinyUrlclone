class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.belongs_to :tinyurl
      t.string :ip_address
      t.timestamps
    end
  end
end
