class Topic < ApplicationRecord
  has_many :searches
  has_many :synth_contents
end
