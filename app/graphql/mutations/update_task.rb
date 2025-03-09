module Mutations
  class UpdateTask < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :completed, Boolean, required: false

    field :task, Types::TaskType, null: true
    field :errors, [String], null: false

    def resolve(id:, title: nil, description: nil, completed: nil)
      task = Task.find_by(id: id)

      return { task: nil, errors: ["Task not found"] } if task.nil?

      if task.update(title: title, description: description, completed: completed)
        { task: task, errors: [] }
      else
        { task: nil, errors: task.errors.full_messages }
      end
    end
  end
end
