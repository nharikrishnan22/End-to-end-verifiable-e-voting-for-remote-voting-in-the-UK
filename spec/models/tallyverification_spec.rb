require 'rails_helper'
include ActionDispatch::TestProcess # for fixture_file_upload

RSpec.describe Tallyverification, type: :model do
  it "is not allowed with no attributes" do
    et = Tallyverification.new
    expect(et).not_to be_valid
  end
  it "has necessary attributes" do
    t = Tallyverification.new
    t.g1_x = "398420842"
    t.g1_y = "398420842"
    t.g2_x = "398420842"
    t.g2_y = "237493274"
    t.s = "21371981371972832"
    t.t = "6"
    t.bigrizivalues = fixture_file_upload('bigrizivalues.csv', 'text/csv')
    expect(t).to be_valid
  end
end
