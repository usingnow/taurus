class Esc < ActiveRecord::Base
  belongs_to :esc_category
  belongs_to :user
end
