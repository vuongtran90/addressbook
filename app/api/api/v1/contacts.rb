module API
	module V1
		class Contacts < Grape::API
			version 'v1'
			format :json

			resource :contacts do

				get do
					contacts = Contact.all
					present contacts, with: API::V1::Entities::Contact 
				end

				get ':id' do
					Contact.find(params[:id])
				end

				params do
					requires :email, type: String
					requires :first_name, type: String
					requires :last_name, type: String
					requires :gender, type: String
					requires :phone, type: Integer 
				end

				post do
					Contact.create!({
						email:params[:email],
						first_name:params[:first_name],
						last_name:params[:last_name],
						gender:params[:gender],
						phone:params[:phone]
					})
				end

				put ':id' do
					@contact = Contact.find(params[:id])
					@contact.email = params[:email] if params[:email]
				    @contact.first_name = params[:first_name] if params[:first_name]
					@contact.last_name = params[:last_name] if params[:last_name]
					@contact.gender = params[:gender] if params[:gender]
					@contact.phone = params[:phone] if params[:phone]
					@contact.save
				end

				delete ':id' do
					Contact.find(params[:id]).destroy!
				end


			end
		end
	end
end