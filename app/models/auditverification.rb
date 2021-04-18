class Auditverification < ApplicationRecord
    validates :big_ri, presence: true
    validates :big_zi, presence: true
    validates :g1_x, presence: true
    validates :g1_y, presence: true
    validates :g2_x, presence: true
    validates :g2_y, presence: true
    validates :vote, presence: true
    validates :ri, presence: true

    # From https://stackoverflow.com/questions/5785503/change-error-field-name-in-rails
    HUMANIZED_ATTRIBUTES = {
        :big_ri => "Ri",
        :big_zi => "Zi",
        :g1_x => "x coordinate of g",
        :g1_y => "y coordinate of g",
        :g2_x => "x coordinate of g2",
        :g2_y => "y coordinate of g2",
        :ri => "ri"

    }

    def self.human_attribute_name(attr, options = {})
        HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end
end
