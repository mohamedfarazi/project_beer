class PagesController < ApplicationController
	skip_before_filter :require_login, :only =>[:goodbye]
	def denied
	end

	def welcome
	end

	def goodbye
	end
end