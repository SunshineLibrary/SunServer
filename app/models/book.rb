class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :provider
  belongs_to :book
end
