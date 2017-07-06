require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it { should belong_to(:follower) }
  it { should belong_to(:followee) }
end
