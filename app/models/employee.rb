class Employee < ApplicationRecord
	has_many :projects, dependent: :destroy
	accepts_nested_attributes_for :projects
end
