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
end
