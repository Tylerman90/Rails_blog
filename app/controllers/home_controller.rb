class HomeController < ApplicationController
	def index
		@fruits = ["apple", "banana", "pear"]
	end 
end