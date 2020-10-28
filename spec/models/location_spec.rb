require 'rails_helper'


describe Location do
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
end  