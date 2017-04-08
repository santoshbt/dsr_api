require 'rails_helper'

RSpec.describe "Task Management", :type => :request do 
	context "it posts and gets valid data" do
		before do
			post "/employees", { 
								:employee => { 	
											:employee_id => 21223,
											:employee_name => "Santosh",
											:employee_email => "santosh.turamari@hpe.com",
											:project_name => "Quantum",
											:activity => "Analyzing the requirement",
											:status => "WIP",
	            							:duration => 1																									
									 }
							} 

		end

		it "creates a task if all the child values are given" do 		
			expect(response.content_type).to eq("application/json")	
			parse_json = JSON(response.body)
			expect(parse_json["success"]).to eq true		
		end

		it "Gets the reports of employee" do
			get "/employees/21223/reports"
			json = JSON.parse(response.body)
			expect(json.size).to eq(1)		
		end
	end

	context "it posts and gets invalid data" do
		before do
			post "/employees", { 
								:employee => { 	
											:employee_id => '2335',
											:employee_name => "Santosh",
											:employee_email => "santosh.turamari@hpe.com",
											:project_name => "",
											:activity => "Analyzing the requirement",
											:status => "WIP",
	            							:duration => 1																									
									 }
							} 

		end

		it "creates a task if all the child values are given" do 		
			expect(response.content_type).to eq("application/json")	
			parse_json = JSON(response.body)
			expect(parse_json["success"]).to eq false		
		end

		it "does not create the task if project child class values are not given" do	
	        expect(response.content_type).to eq("application/json")	
			parse_json = JSON(response.body)
			expect(parse_json["success"]).to eq false						
		end
	end	

	
end

# post :create, {book_id: @book.id, comment: {user_id: 101, book_id: @book.id, description: "worth to buy"}}