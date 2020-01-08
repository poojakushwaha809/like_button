class WelcomesController < ApplicationController
	def index
		@articles = Article.all
		
	end
end
