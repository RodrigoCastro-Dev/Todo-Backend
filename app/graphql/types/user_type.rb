# app/graphql/types/user_type.rb
module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # field :reset_password_token, String, null: true
    # field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    # field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
    # field :jti, String, null: true
  end
end
