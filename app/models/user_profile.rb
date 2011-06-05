class UserProfile < ActiveRecord::Base
  #validates_presence_of :first_name, :last_name
  belongs_to :user

  # attr_accessible :first_name, :last_name, :address, :place, :post_code, :municipality, :county, :country

end
