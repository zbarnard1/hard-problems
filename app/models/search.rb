class Search < ApplicationRecord
  belongs_to :topic
  has_many :results, through: :search_results
  has_many :keywords, through: :search_terms
end
