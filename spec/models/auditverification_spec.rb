require 'rails_helper'

RSpec.describe Auditverification, type: :model do
  it "is not allowed with no attributes" do
    a = Auditverification.new
    expect(a).not_to be_valid
  end
  it "has necessary attributes" do
    b = Auditverification.new
    b.big_ri = "point"
    b.big_zi = "point"
    b.g1_x = "398420842"
    b.g1_y = "237493274"
    b.g2_x = "7987987"
    b.g2_y = "7979877987"
    b.vote = 1
    b.ri = "902183123123"
    expect(b).to be_valid
  end
end
