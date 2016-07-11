class Wordcard < ApplicationRecord
  validates :word, :definition, presence: true, allow_blank: false
end
