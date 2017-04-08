class AddMissingFieldsToEmployee < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :project_name, :string
  	add_column :employees, :activity, :string
  	add_column :employees, :status, :string
  	add_column :employees, :duration, :integer
  end
end
