class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :category
      t.boolean :public
      t.string :status
      t.integer :day_number
      t.integer :event_slug

      t.timestamps
    end
  end
end
