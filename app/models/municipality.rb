class Municipality < ActiveRecord::Base
  belongs_to :county
  has_many :post_codes
end
