class FoodCategory < ActiveRecord::Base
	has_many :food 
end
