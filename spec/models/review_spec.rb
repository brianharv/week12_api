require 'rails_helper'

describe Review do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:body) }
end 