class BooksController < ApplicationController

	def top_page

	end

	def index
		@book = Book.new
		@books = Book.all
	end
	def create
		@books = Book.all
		@book = Book.new(book_params)
		if 	@book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book.id)#詳細ページへ(show.html.erb)
		else
			render action: :index
		end
	end

	def show
		@book = Book.find(params[:id])

	end
	def edit
		@book = Book.find(params[:id])
	end

	def update
		@books = Book.all
	    @book = Book.find(params[:id])
	    if @book.update(book_params)
	    	flash[:notice] = "Book was successfully updated."
	    	redirect_to book_path(@book.id)#詳細ページへ(show.html.erb)
	    else
	    	render action: :edit
		end
  	end

  	def destroy
  		book = Book.find(params[:id])
  		book.destroy
  		redirect_to books_path
  	end




	private#-----------------------------------------
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
