class Company < ActiveRecord::Base
  has_one :industry, :class_name => "Industry"
  has_many :jobs
  validates_presence_of :name, :short_description, :address, :place, :country, :postal_code, :org_number
  validates_uniqueness_of :name

  scope :recruiter, where(:recruiter => true)
end
