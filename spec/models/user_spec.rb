require 'rails_helper'

RSpec.describe User, type: :model do
  it "닉네임으로 회원을 생성할 수 있다" do
  	User.create(nickname: "test", password: "test12")
    expect(User.count).to eq 1
	end
end
