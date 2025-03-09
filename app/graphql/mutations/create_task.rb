# app/graphql/mutations/create_task.rb
module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false

    field :task, Types::TaskType, null: false

    def resolve(title:, description:)
      user = context[:current_user]
      
      if user.present?
        task = Task.find_or_create_by!(
          title: title,
          description: description,
          user: user
        )
        { task: task }
      else
        raise GraphQL::ExecutionError.new("User not authenticated")
      end
    end
  end
end
