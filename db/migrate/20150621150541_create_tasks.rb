class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.integer :parent_id
      t.string  :name
      t.text    :description
      t.timestamps
    end
  end
end
