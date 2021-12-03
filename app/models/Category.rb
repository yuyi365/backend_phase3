class Category < ActiveRecord::Base
  has_many :items
  has_many :lists, through: :items
end
