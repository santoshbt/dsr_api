class Employee < ApplicationRecord
	validates :project_name, presence: true
	validates :activity, presence: true
	validates :status, presence: true
	validates :duration, presence: true
end
