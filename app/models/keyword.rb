class Keyword < ApplicationRecord
  has_many :searches, through: :search_terms
  has_many :results, through: :result_keywords
end
