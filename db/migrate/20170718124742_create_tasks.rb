class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :project, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
