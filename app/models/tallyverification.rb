class Tallyverification < ApplicationRecord
    has_one_attached :bigrizivalues
    validates :bigrizivalues, presence: true
end
