# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tasks, [ Types::TaskType ], null: false do
      argument :description, String, required: false
      argument :completed, Boolean, required: false
    end

    def tasks(description: nil, completed: nil)
      tasks = Task.by_description(description)
                  .by_status(completed)
                  .order(:completed, created_at: :desc)

      tasks
    end
  end
end
