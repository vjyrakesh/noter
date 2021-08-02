require 'rails_helper'

RSpec.describe Note, type: :model do
  it "is invalid without content" do
    expect(Note.new).to be_invalid
  end

  it "is valid with content" do
    expect(Note.new(content:"dummy", user:User.new(username:"dummy",password:"dummy"))).to be_valid
  end
end
