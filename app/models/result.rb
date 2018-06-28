require_relative '../../lib/adapters/dbpedia_adapter'

class Result < ApplicationRecord
  has_many :search_results
  has_many :result_keywords
  has_many :supporting_docs
  has_many :searches, through: :search_results
  has_many :keywords, through: :result_keywords
  has_many :synth_contents, through: :supporting_docs

  validates :search_id, :url, :title, :snippet, presence: true
  
  # to do: Add column to the Results table to hold the name of the adapter.

  after_create do |result|
    DbpediaAdapter.expand_result(result.url, result)
  end

end