# app/graphql/mutations/delete_task.rb
module Mutations
  class DeleteTask < BaseMutation
    argument :id, ID, required: true

    field :message, String, null: false

    def resolve(id:)
      task = Task.find_by(id: id)
      if task
        task.destroy
        { message: "Task deleted successfully" }
      else
        raise GraphQL::ExecutionError, "Task not found"
      end
    end
  end
end
