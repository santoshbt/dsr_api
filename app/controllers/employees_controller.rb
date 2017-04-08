class EmployeesController < ApplicationController

	def index
		@employees = Employee.today_reports		
		render json: @employees		
	end

	def create
		@employee = Employee.new(employee_params)		

		if @employee.save
			render json: {success: true}
		else
			render json: {success: false}
		end
	end

	def reports
		@employee_reports = Employee.my_reports(params[:employee_id])		
		puts @employee_reports.inspect
		if @employee_reports.size > 0
			render plain: @employee_reports.to_json
		else
			render json: {success: false}
		end	
	end

	private 
	def employee_params
		params.require(:employee).permit(:employee_id, :employee_name, :employee_email, :project_name, :activity, 
											:status,:duration)           
	end
end