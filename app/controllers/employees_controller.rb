class EmployeesController < ApplicationController
	
	def create
		@employee = Employee.new(employee_params)		

		if @employee.save
			ActiveRecord::Base.transaction do
				projects_attributes = employee_params[:projects_attributes][0]
				task_attributes = projects_attributes[:tasks_attributes]

				@employee.projects.build(projects_attributes)
				@employee.save

				@employee.projects.last.tasks.build(task_attributes)
				@employee.save

				render json: {success: true}
			end
		else
			render json: {success: false}
		end
	end

	private 
	def employee_params
		params.require(:employee).permit(:employee_id, :employee_name, :employee_email, 
              projects_attributes: [:name, :id, :employee_id, 
              tasks_attributes: [:activity, :status, :duration, :id, :project_id]
              ] )
	end
end