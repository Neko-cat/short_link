class Link < ApplicationRecord
    include RedisConcern
    validates :original, presence: true

    def self.generate_unique_short
        unique_short = SecureRandom.alphanumeric(6)
        while Link.where(short: unique_short).exists? == true do
          unique_short = SecureRandom.alphanumeric(6)
        end
        return unique_short
    end
end
