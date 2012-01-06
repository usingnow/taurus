class InnerSkuCart < ActiveRecord::Base
  belongs_to :sku
  belongs_to :user
end
