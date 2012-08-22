require 'spec_helper'

describe Parameterize do
  it 'parameterizes the source attribute' do
    post = Post.new title: "Hey Ho, Let's Go!"
    post.valid?
    expect(post.param).to eq('hey-ho-let-s-go')
  end

  context 'with a custom source attribute and target attribute' do
    it 'parameterizes the source attribute' do
      user = User.new name: 'Donald E. Knuth'
      user.valid?
      expect(user.slug).to eq('donald-e-knuth')
    end
  end

  context 'with an existing target attribute' do
    it 'does not parameterize the source attribute' do
      post = Post.new title: "Hey Ho, Let's Go!", param: 'hello-world'
      post.valid?
      expect(post.param).to eq('hello-world')
    end

    context 'with :update set to true' do
      it 'parameterizes the source attribute' do
        user = User.new name: 'Donald E. Knuth', slug: 'john-doe'
        user.valid?
        expect(user.slug).to eq('donald-e-knuth')
      end
    end
  end

  describe '#to_param' do
    it 'returns the target attribute' do
      post = Post.new param: 'hello-world'
      expect(post.to_param).to eq('hello-world')
    end

    context 'with a custom target attribute' do
      it 'returns the custom target attribute' do
        user = User.new slug: 'john-doe'
        expect(user.to_param).to eq('john-doe')
      end
    end

    context 'without a param' do
      it 'returns the id' do
        post = Post.new
        post.id = 1
        expect(post.to_param).to eq('1')
      end
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
