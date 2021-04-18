class Wellformednessverification < ApplicationRecord
    validates :c_1, presence: true
    validates :c_2, presence: true
    validates :r_1, presence: true
    validates :r_2, presence: true
    validates :g1_x, presence: true
    validates :g1_y, presence: true
    validates :g2_x, presence: true
    validates :g2_y, presence: true
    validates :big_ri_x, presence: true
    validates :big_ri_y, presence: true
    validates :big_zi_x, presence: true
    validates :big_zi_y, presence: true

    # From https://stackoverflow.com/questions/5785503/change-error-field-name-in-rails
    HUMANIZED_ATTRIBUTES = {
        :c_1 => "c_1",
        :c_2 => "c_2",
        :r_1 => "r_1",
        :r_2 => "r_2",    
        :g1_x => "x coordinate of g",
        :g1_y => "y coordinate of g",
        :g2_x => "x coordinate of g2",
        :g2_y => "y coordinate of g2",
        :big_ri_x => "x coordinate of Ri",
        :big_ri_y => "y coordinate of Ri",
        :big_zi_x => "x coordinate of Zi",
        :big_zi_y => "y coordinate of Zi"
    }

    def self.human_attribute_name(attr, options = {})
        HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end
end
