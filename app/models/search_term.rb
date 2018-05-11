class SearchTerm < ApplicationRecord
  belongs_to :keyword
  belongs_to :search
end
