class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :activity
      t.string :status
      t.integer :duration
      t.references :project, :null => false      
      t.timestamps
    end
  end
end
