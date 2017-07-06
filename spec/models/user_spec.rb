require 'rails_helper'

RSpec.describe User, type: :model do

    it { should have_many(:notes) }
    it { should have_many(:likes) }
    it { should have_many(:following) }
    it { should have_many(:followers) }
    it { should validate_presence_of(:email) }

    describe 'validates uniqness of email' do
      subject { User.create(email: 'example@email.com', password: '123456') }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end

end
