require 'spec_helper'

describe Post do
  it 'has a valid factory' do
    create(:post).should be_valid
  end
  it 'is invalid without a title' do
    build(:post, title: nil).should be_invalid
  end
  it 'is invalid without content' do
    build(:post, content: nil).should be_invalid
  end
end
