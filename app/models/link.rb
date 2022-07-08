class Link < ApplicationRecord
    self.primary_key = :short
    validates :original, presence: true
end
