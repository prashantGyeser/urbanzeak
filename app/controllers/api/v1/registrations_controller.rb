class Api::V1::RegistrationsController < Devise::RegistratonsController
	respond_to :json

	def create
		super
	end
	
end