module API
	module V1
		class Addresses < Grape::API
			version 'v1'
			format :json

			resource :addresses do
				get do
					addresses =	Address.all
				end

				get ':id' do
					Address.find(params[:id])
				end
				
				params do
					requires :contact_id, type: Integer
				end
				
				post do
					Address.create!({
						address_line_1:params[:address_line_1],
						address_line_2:params[:address_line_2],
						telephone:params[:telephone],
						is_active:params[:is_active],
						contact_id:params[:contact_id]
					})
				end

				put ':id' do
					@address = Address.find(params[:id])
					@address.address_line_1 = params[:address_line_1] if params[:address_line_1]
					@address.address_line_2 = params[:address_line_2] if params[:address_line_2]
					@address.telephone = params[:telephone] if params[:telephone]
					@address.is_active = params[:is_active] if params[:is_active]
					@address.contact_id = params[:contact_id] if params[:contact_id]
					@address.save
				end

				delete ':id' do 
					Address.find(params[:id]).destroy!
				end				
			end
		end
	end
end			