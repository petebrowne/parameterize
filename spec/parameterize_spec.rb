require 'spec_helper'

describe Parameterize do
  it 'parameterizes the source field' do
    post = Post.new :title => "Hey Ho, Let's Go!"
    post.valid?
    post.param.should == 'hey-ho-let-s-go'
  end
  
  context 'with a different source field' do
    it 'parameterizes the source field' do
      user = User.new :name => 'Donald E. Knuth'
      user.valid?
      user.param.should == 'donald-e-knuth'
    end
  end
  
  describe '#to_param' do
    it 'returns the param' do
      post = Post.new :title => "Hey Ho, Let's Go!"
      post.valid?
      post.to_param.should == 'hey-ho-let-s-go'
    end
  end
  
  describe 'matcher' do
    it 'checks if Post parameterized :title' do
      Post.new.should parameterize(:title)
    end
    
    it 'checks if User parameterized :name' do
      User.new.should parameterize(:name)
    end
  end
end
