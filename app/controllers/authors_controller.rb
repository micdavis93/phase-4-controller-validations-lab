class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)
    if author.isvalid?
      render json: author, :content_found
    end
    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
