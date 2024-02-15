require 'rails_helper'

RSpec.describe UserCircle, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:circle) }

end
