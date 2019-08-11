module Types
  class UpdateQuestionResult < Types::BaseUnion
    possible_types QuestionType, DocumentNotFoundError

    def self.resolve_type(object, _context)
      return DocumentNotFoundError if object.is_a?(Mongoid::Errors::DocumentNotFound)
      QuestionType
    end
  end
end