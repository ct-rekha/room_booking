class User < ActiveRecord::Base
	include Mongoid::Document
	field :name, type: String
	field :email, type: String
	field :password_digest, type: String
	validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true
	validates :name, presence: true
	
	has_secure_password
	validates :password, length: {minimum: 5, maximum: 16}, presence: true


end