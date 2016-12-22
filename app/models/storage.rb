class Storage < ActiveRecord::Base
	has_attached_file :file, :default_url => "/files/:style/missing.doc"
	validates_attachment_content_type :file, :content_type => /\Aapplication\/.*\Z/
	#validates_with Attachmenuser_quotatSizeValidator, :attributes => :file, :less_than => 10.megabytes
	belongs_to :user
end
