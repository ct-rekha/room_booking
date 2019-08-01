class User
	include Mongoid::Document
	field :name, type: String
	field :email, type: String
	field :password_digest, type: String
	validates :password_digest, length: {minimum: 8, maximum: 16}, presence: true
	validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates :name, presence: true
	
end