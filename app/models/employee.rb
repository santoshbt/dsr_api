class Employee < ApplicationRecord
	validates :project_name, presence: true
	validates :activity, presence: true
	validates :status, presence: true
	validates :duration, presence: true

	scope :today_reports, -> { where(["DATE(created_at) = ?", Date.today]).order('employee_name asc') } 

	STAKE_EMAILS = ['bt.santosh01@gmail.com','santosh.turamari85@gmail.com']

	def self.my_reports(employee_id)
		reports = where('employee_id = ? and DATE(created_at) = ?',employee_id, Date.today)
	end

	def self.send_reminders
		employees = today_reports.pluck('id, employee_email')
		employees.each do |employee|
			EmployeeMailer.report_reminder(employee[0], employee[1], APP_URL).deliver_now
		end
	end

	def self.send_dsr
		reports = today_reports
		EmployeeMailer.send_dsr(reports, STAKE_EMAILS).deliver_now
	end
end
