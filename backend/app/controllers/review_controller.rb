class ReviewController < Sinatra::Base
  post "/reviews" do
    review = Review.create(
      title: params[:title],
      body: params[:body],
      rating: params[:rating],
      board_game_id: params[:board_game_id],
      user_id: params[:user_id]
    )
    review.to_json(include: :user)
  end

  patch "/reviews/:id" do
    review = Review.find(params[:id])
    review.update(
      title: params[:title],
      body: params[:body],
      rating: params[:rating],
      board_game_id: params[:board_game_id],
      user_id: params[:user_id]
    )
    review.to_json(include: :user)
  end

  delete "/reviews/:id" do
    review = Review.find(params[:id])
    if review.destroy
      { success: true, message: "Item deleted", review: review }.to_json
    else
      status 422
      { success: false, message: "Failed to delete item" }.to_json
    end
  end
end
