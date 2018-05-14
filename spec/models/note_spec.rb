require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:likes) }

  describe 'note should have a body' do
    it { should validate_presence_of(:body) }
  end
end
