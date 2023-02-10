class ApiController < ApplicationController

    def show_api_key
        # api_key = ENV['API_KEY']
        render json: {message: "hello form a deployed rails backend"}
    end


end