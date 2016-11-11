class Blog < ActiveRecord::Base	
	has_many :posts, :dependent => :delete_all
	has_many :owners, :dependent => :delete_all
	validates :name, presence:true 
end
