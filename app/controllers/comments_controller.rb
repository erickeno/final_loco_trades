class CommentsController < ApplicationController
  def new
    @parent_id = params.delete(:parent_id)
    @commentable = find_commentable
    @comment = Comment.new( :parent_id => @parent_id, 
                            :commentable_id => @commentable.id,
                            :commentable_type => @commentable.class.to_s)

  end
  
  def create
    
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Successfully posted an offer."
      redirect_to @commentable
    else
      flash[:error] = "Error adding an offer."
    end
  end
 
  private
  def comment_params
  	params.require(:comment).permit(:content, :parent_id, :commentable_id, :commentable_type)
  end
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
