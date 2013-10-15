class MessagesController < ApplicationController

	def new

		render "groups/new", formats: [:json]
	end

	def get

		render "groups/get", formats: [:json]
	end

end
