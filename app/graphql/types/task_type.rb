module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String
    field :completed, Boolean, null: false

    field :user, Types::UserType, null: false
  end
end
