Rails.application.routes.draw do
	root to:"books#top_page"
	get "/books", to:"books#index", as: "books"
	post "/create", to:"books#create"
	get "/books/:id", to:"books#show", as: "book"
	get "/books/:id/edit", to:"books#edit", as: "edit_book"
	put "/books/:id", to:"books#update"
	delete "/books/:id", to:"books#destroy"
end
