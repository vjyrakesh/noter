require 'rails_helper'

RSpec.describe Note, type: :model do

  

  it "is invalid without content" do
    expect(Note.new).to be_invalid
  end

  it "is valid with content" do
    user1 = User.new(username:"dummy",password:"dummy")
    expect(Note.new(content:"dummy", user: user1)).to be_valid
  end

  context ".search" do 
    let(:user1) {
      User.create(username: "dummy", password: "dummy")
    }
    it "returns the note containing search query" do
      # user1 = User.create(username:"dummy",password:"dummy")
      note1 = Note.create(content: "first note", user: user1)
      expect(Note.search("first", user1.id).first.content).to eq("first note")
    end

    it "returns atleast 1 note for valid search query" do
      # user1 = User.create(username:"dummy",password:"dummy")
      note1 = Note.create(content: "first note", user: user1)
      expect(Note.search("first", user1.id).count).to eq(1)
    end
  end
end
