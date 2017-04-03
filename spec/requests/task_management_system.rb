require 'rails_helper'

RSpec.describe "Task Management", :type => :request do 
	it "creates a task" do 
	
		post "/tasks", { 
						:employee => { 	
										:employee_id => 21223,
										:employee_name => "Santosh",
										:employee_email => "santosh.turamari@hpe.com",
										:tasks => 	{
													:project_name => "Quantum",
													:activity => "Analyzing the requirement",
													:status => "WIP",
													:duration => 1
												}
						 			}
						} 

		expect(response.content_type).to eq("application/json")	
		expect(response).to have_http_status(:created)			
	end
end