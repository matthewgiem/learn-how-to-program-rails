require 'rails_helper'

describe Week do
  it { should validate_presence_of :name }
  it { should belong_to :course }
end
