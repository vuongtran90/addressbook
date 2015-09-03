module API
	module V1
		module Entities
			class Address < Grape::Entity
				# expose :id
				# expose :contact_id
				expose :address_line_1
				expose :address_line_2
				expose :telephone
				expose :is_active				
			end
		end
	end
end