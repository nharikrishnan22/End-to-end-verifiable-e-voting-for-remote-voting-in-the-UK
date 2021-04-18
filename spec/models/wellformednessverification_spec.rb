require 'rails_helper'

RSpec.describe Wellformednessverification, type: :model do
  it "is not allowed with no attributes" do
    w_n = Wellformednessverification.new
    expect(w_n).not_to be_valid
  end
  it "has necessary attributes" do
    w = Wellformednessverification.new
    w.c_1 = "273947"
    w.c_2 = "238749237"
    w.r_1 = "398420842"
    w.r_2 = "237493274"
    w.g1_x = "7987987"
    w.g1_y = "7979877987"
    w.g2_x = "7987987"
    w.g2_y = "7979877987"
    w.big_ri_x = "7987987"
    w.big_ri_y = "7979877987"
    w.big_zi_x = "7987987"
    w.big_zi_y = "7979877987"
    expect(w).to be_valid
  end
end
