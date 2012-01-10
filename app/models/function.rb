class Function < ActiveRecord::Base
  has_many :operatings
  belongs_to :component
end
