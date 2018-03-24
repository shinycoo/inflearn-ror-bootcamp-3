class PostController < ApplicationController
  
  skip_before_filter :require_login, :only => [:list]
  
  def create
    _author = params[:author]
    _title = params[:title]
    _contents = params[:contents]
    
    post = Post.new(author: _author, title: _title, contents: _contents) ## record / row
    post.save
    
    redirect_to controller:'post', action:'list'
  end

  def new
    
  end
  
  def list
    @posts = Post.all
    
  end
  
  def modify
    _id = params[:id]
    @post = Post.find(_id)
    
  end
  
  def update 
    _id = params[:id]
    _author = params[:author]
    _title = params[:title]
    _contents = params[:contents]
    
    post = Post.find(_id)
    
    post.author = _author
    post.title = _title
    post.contents = _contents
    
    post.save
    
    redirect_to controller: 'post', action: 'list'
  end
  
  def delete
    _id = params[:id]
    
    post = Post.find(_id)
    post.destroy
    
    redirect_to controller: 'post', action: 'list'
  end
end
