class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :list
end
