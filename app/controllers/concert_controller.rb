class ConcertController < ApplicationController
    get "/concerts" do
    concerts = Concert.all
    concerts.to_json(include: :users)
  end

    post "/concerts" do
      concert = Concert.new(params)
      if concert.save
        status 201
        concert.to_json
      else
        status 422
        { errors: concert.errors.full_messages }.to_json
      end
    end
end
