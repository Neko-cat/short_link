class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links, id: false, primary_key: :short do |t|
      t.string :short, limit: 6, null: false
      t.string :original
      t.integer :view, default: 0
      t.timestamps

      t.index :short, unique: true
    end
  end
end
