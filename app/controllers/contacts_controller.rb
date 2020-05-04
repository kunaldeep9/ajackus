class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			ContactkMailer.contact_mail(@contact)
			render json: {contact: @contact}, status: :created
		else
			render json: @contact.errors, status: :unprocessable_entity 
		end
	end

	def update
	end

	def contact_params
		contact_hash = params.require(:contact).permit(:first_name,:last_name,:email,:mobile, :message)
		contact_hash
	end
end
