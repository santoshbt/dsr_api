class Project < ApplicationRecord
	belongs_to :employee, optional: true
	has_many :tasks,  dependent: :destroy
	accepts_nested_attributes_for :tasks

	validates :name, presence: true
end
