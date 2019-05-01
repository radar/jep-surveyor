module Types
  class DocumentNotFoundError < Types::BaseObject
    field :errors, String, null: false

    def errors
      "Document with that ID wasn't found"
    end
  end
end
