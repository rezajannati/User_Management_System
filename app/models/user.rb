class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password, :presence => true
	validates :password, :confirmation => true
end
