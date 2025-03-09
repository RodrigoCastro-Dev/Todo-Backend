class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  devise :database_authenticatable, :registerable, :recoverable, :jwt_authenticatable, jwt_revocation_strategy: self
end
