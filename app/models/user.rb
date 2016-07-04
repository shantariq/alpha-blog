class User < ActiveRecord::Base
	before_save { self.email =email.downcase }
	has_many :articles, dependent: :destroy
	validates :username, presence: true, 
	uniqueness: { case_sensitive: false }, 
	length: {minimum: 3, maximum:30}
valid_email_regex= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, 
	uniqueness: { case_sensitive: false }, 
	length: { maximum:100},
	format: {with: valid_email_regex}
	
 has_secure_password
end