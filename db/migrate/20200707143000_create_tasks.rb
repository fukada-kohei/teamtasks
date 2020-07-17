class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.references :team, foreign_key: true
      t.string :progress
      t.date :due_date

      t.timestamps
    end
  end
end
