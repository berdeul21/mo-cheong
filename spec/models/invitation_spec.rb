require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it "청첩장을 만들 수 있다" do
  	Invitation.create
    expect(Invitation.count).to eq 1
  end
end
