class BookCommentsController < ApplicationController

	def create
    	@book = Book.find(params[:book_id])
    	@book_new = Book.new
    	@book_comment = @book.book_comments.new(book_comment_params)
    	@book_comment.user_id = current_user.id
    	@book_comment.save
    	render :index
	end

	def destroy
	    @book_comment = BookComment.find(params[:book_id])
	    @book_comment.destroy
	    render :index
 	end

	private
		def book_comment_params
			params.require(:book_comment).permit(:comment)
		end

end
