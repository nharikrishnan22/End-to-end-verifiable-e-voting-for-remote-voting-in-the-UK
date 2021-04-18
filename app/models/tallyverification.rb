class Tallyverification < ApplicationRecord
    has_one_attached :bigrizivalues
    validates :bigrizivalues, presence: true

    validates :g1_x, presence: true
    validates :g1_y, presence: true
    validates :g2_x, presence: true
    validates :g2_y, presence: true
    validates :s, presence: true
    validates :t, presence: true

    # From https://stackoverflow.com/questions/5785503/change-error-field-name-in-rails helps make error messages clearer
    HUMANIZED_ATTRIBUTES = {
        :g1_x => "x coordinate of g",
        :g1_y => "y coordinate of g",
        :g2_x => "x coordinate of g2",
        :g2_y => "y coordinate of g2",
        :s => "s",
        :t => "t"
    }
    def self.human_attribute_name(attr, options = {})
        HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end
end
