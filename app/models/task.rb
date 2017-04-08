class Task < ApplicationRecord
	belongs_to :project, optional: true

	validates :activity, presence: true
	validates :status,   presence: true
	validates :duration, presence: true
end
