class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :allday
      t.text :memo

      t.timestamps
    end
  end
end
