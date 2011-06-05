class PostCode < ActiveRecord::Base
  belongs_to :municipality
  set_primary_key :post_code
end
