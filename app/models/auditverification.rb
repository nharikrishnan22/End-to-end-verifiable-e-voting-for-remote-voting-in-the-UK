class Auditverification < ApplicationRecord
    validates :big_ri, presence: true
    validates :big_zi, presence: true
    validates :g1_x, presence: true
    validates :g1_y, presence: true
    validates :g2_x, presence: true
    validates :g2_y, presence: true
    validates :vote, presence: true
    validates :ri, presence: true
end
