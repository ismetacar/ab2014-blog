class User < ActiveRecord::Base
	has_many :books
	mount_uploader :image, ImageUploader
end
