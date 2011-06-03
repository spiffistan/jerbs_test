class Industry < ActiveRecord::Base
  has_many :companies, :class_name => "Company"
end
