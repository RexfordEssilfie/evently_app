class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :name
      t.text :description
      t.time :start_time
      t.time :end_time
      t.text :visibility

      t.timestamps
    end
  end
end
