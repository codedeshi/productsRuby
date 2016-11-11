class User < ActiveRecord::Base
	has_many :owners, :dependent => :delete_all
	has_many :posts, :dependent => :delete_all
	has_many :messages, :dependent => :delete_all
end
