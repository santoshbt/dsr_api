class EmployeeMailer < ApplicationMailer
	def report_reminder(employee_id, employee_email, url)		
		@email = employee_email
		@url = url
		@id = employee_id 
		mail(to: @email, subject: 'Reminder to send DSR !!!')
	end	

	def send_dsr(reports, stake_emails)
		@reports = reports
		@email = stake_emails
		mail(to: @email, subject: "DSR #{Date.today}")
	end
end
