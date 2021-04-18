require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid if no attributes set" do
    u_n = User.new
    expect(u_n).not_to be_valid
  end
  it "is valid with necessary attributes" do
    u = User.new
    u.email = "john@example.com"
    u.dateofbirth = "1970-11-23"
    u.firstname = "John"
    u.lastname = "Doe"
    u.password = "johndoe91"
    expect(u).to be_valid
  end
end
