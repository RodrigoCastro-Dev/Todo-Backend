# app/graphql/mutations/create_task.rb
module Mutations
  class CreateTask < BaseMutation
    argument :description, String, required: false
    argument :completed, Boolean, required: false

    field :task, Types::TaskType, null: false

    def resolve(description:, completed:)
      user = context[:current_user]

      if user.present?
        task = Task.find_or_initialize_by(
          description: description,
          user: user
        )
        task.completed = completed
        task.save

        { task: task }
      else
        raise GraphQL::ExecutionError.new("User not authenticated")
      end
    end
  end
end
