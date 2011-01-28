require 'spec_helper'

describe Parameterize do
  let(:post) { Post.new }
  let(:user) { User.new }
  
  it 'parameterizes the source field' do
    post.title = "Hey Ho, Let's Go!"
    post.valid?
    post.param.should == 'hey-ho-let-s-go'
  end
  
  context 'with a different source field' do
    it 'parameterizes the source field' do
      user.name = 'Donald E. Knuth'
      user.valid?
      user.param.should == 'donald-e-knuth'
    end
  end
  
  describe '#to_param' do
    it 'returns the param' do
      post.title = "Hey Ho, Let's Go!"
      post.valid?
      post.to_param.should == 'hey-ho-let-s-go'
    end
  end
  
  describe 'matcher' do
    context 'with Post' do
      subject { post }
      it      { should parameterize(:title) }
    end
    
    context 'with User' do
      subject { user }
      it      { should parameterize(:name) }
    end
  end
end
