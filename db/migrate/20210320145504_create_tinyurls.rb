class CreateTinyurls < ActiveRecord::Migration[6.1]
  def change
    create_table :tinyurls do |t|
      t.string :token, unique: true
      t.string :url
      t.timestamps
    end
  end
end
