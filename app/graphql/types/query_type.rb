# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :tasks, [ Types::TaskType ], null: false

    def tasks
      Task.all.order(id: :desc)
    end
  end
end
