module API
	module V1
		module Entities
			class Contact < Grape::Entity
				expose :email
				expose :first_name
				expose :last_name
				expose :gender
				expose :phone
				expose :address, using: API::V1::Entities::Address, as: :addresses
			end
		end
	end
end
