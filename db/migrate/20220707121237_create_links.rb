class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original
      t.integer :view, default: 0
      t.string :short, index: { unique: true}
      t.integer :user_id
      t.timestamps
    end
  end
end
