module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :completed, Boolean, null: false
    
    field :user, Types::UserType, null: false
  end
end
