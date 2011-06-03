class UserProfile < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_one :user

  scope :employer_contact, where('company_id <> NULL');
end
