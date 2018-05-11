class Result < ApplicationRecord
  has_many :searches, through: :search_results
  has_many :keywords, through: :result_keywords
  has_many :synth_contents, through: :supporting_docs
end
