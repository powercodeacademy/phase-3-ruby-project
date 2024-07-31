class ReviewController < Sinatra::Base
  post "/reviews" do
    review = Review.create(
      title: params[:title],
      body: params[:body],
      rating: params[:rating],
      board_game_id: params[:board_game_id],
      user_id: params[:user_id]
    )
    review.to_json(include: :user )
  end
end
