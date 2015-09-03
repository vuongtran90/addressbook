module API
	module V1
		class Base < Grape::API
			mount API::V1::Addresses
			mount API::V1::Contacts
		end
	end
end