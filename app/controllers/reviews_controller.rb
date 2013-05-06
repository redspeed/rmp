class ReviewsController < ApplicationController
  # Adapted from GAVIN MORRICE'S VIDEO

  respond_to :html, :json, :xml
  
  
  def index
    @reviews = Review.all 
    respond_with @reviews  
  end


  def index
    @reviews = Review.search(params[:search])
    respond_with @reviews
  end

  
  def show
    @review = Review.find(params[:id]) 
    respond_with @review   
  end



 
  def new
    @review = Review.new    
  end

  
  def edit
    @review = Review.find(params[:id])
  end


  def create
    @review = Review.new(params[:review])
    @review.save
      respond_with @review
  end


  def update
    @review = Review.find(params[:id])   
    @review.update_attributes(params[:review]) 
    respond_with @review
  end

  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_with @review    
  end
end
