class Project < ActiveRecord::Base
	belongs_to :project_category
	belongs_to :user
	has_many :member_project
	has_many :activity
end
