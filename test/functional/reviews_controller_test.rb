require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { Address: @review.Address, City: @review.City, Comment: @review.Comment, Date_of_Visit: @review.Date_of_Visit, Phone: @review.Phone, Rating: @review.Rating, User: @review.User, Venue_Name: @review.Venue_Name }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    put :update, id: @review, review: { Address: @review.Address, City: @review.City, Comment: @review.Comment, Date_of_Visit: @review.Date_of_Visit, Phone: @review.Phone, Rating: @review.Rating, User: @review.User, Venue_Name: @review.Venue_Name }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
