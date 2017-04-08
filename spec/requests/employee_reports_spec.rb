require 'rails_helper' 

RSpec.describe "Get Employee Reports", :type => :request do 
	it "Gets the reports of employee" do
		get "/employees/1234/reports"
		# {
		# 	:employee => [{
		# 		:employee_id => 1234,
		# 		:employee_name => "Santosh",
		# 		:employee_email => "bt.santosh01@gmail.com",
		# 		:project_name => "Quantum",
		# 		:activity => "Analyzing the requirement",
		# 		:duration => 1
		# 	}]
		# }

		json = JSON.parse(response.body)
		expect(response).to be_success
		
		# expect(response.content_type).to eq("application/json")	
		# parse_json = JSON(response.body)
		# expect(parse_json["success"]).to eq true	
	end
end