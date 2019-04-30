module Types
  class MutateRatingQuestionResult < Types::BaseUnion
    possible_types QuestionType, ValidationErrors

    def self.resolve_type(object, _context)
      if object.persisted?
        QuestionType
      else
        ValidationErrors
      end
    end
  end
end