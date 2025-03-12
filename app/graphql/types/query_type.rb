# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tasks, [Types::TaskType], null: false do
      argument :description, String, required: false
      argument :completed, Boolean, required: false
    end

    def tasks(description: nil, completed: nil)
      tasks = Task.all.order(id: :desc)
      tasks = tasks.where('description LIKE ?', "%#{description}%") if description
      tasks = tasks.where(completed: completed) unless completed.nil?
      tasks
    end
  end
end
