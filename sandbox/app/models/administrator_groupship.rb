class AdministratorGroupship < ActiveRecord::Base
  belongs_to :administrator
  belongs_to :group
end
