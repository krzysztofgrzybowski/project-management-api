class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :owner, index: true, foreign_key: { to_table: :users }
    end
  end
end
