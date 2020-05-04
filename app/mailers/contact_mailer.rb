class ContactMailer < ApplicationMailer
	default to: 'info@ajackus.com'
	def contact_mail
		@email = @contact.email
		@message = @contact.message
	    mail(from: @email, subject: 'Welcome to My Awesome Site')
	end
end
