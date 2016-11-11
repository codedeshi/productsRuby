class User < ActiveRecord::Base
	has_secure_password
	has_many :products
	has_many :sales, :class_name => 'Transaction', :foreign_key => 'seller_id'
	has_many :purchases, :class_name => 'Transaction', :foreign_key => 'buyer_id'
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
