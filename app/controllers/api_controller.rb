class ApiController < ApplicationController

    def show_api_key
        api_key = ENV['API_KEY']
        render json: api_key
    end


end