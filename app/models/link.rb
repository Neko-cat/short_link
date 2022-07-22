class Link < ApplicationRecord
    include RedisConcern
    validates :original, presence: true
end
