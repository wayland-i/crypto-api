class ApiController < ApplicationController

    #GET
    def products

        response = HTTParty.get('https://dummyjson.com/products')
        render json: {data: response.body}

        # products = https://dummyjson.com/products
        # render json: products
        # render plain: 'hello'
    end

    #GET
    def cmc_api
        api_key = ENV['API_KEY']
        response = HTTParty.get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?slug=bitcoin', headers: {'X-CMC_PRO_API_KEY' => api_key})
        
        render json: {data: response.body}

        #this was my best attempt before I found the 'rack-cors' gem
        #render json: {data: response.body}, headers: {'Access-Control-Allow-Origin' => 'http://localhost:4000'}
    end


end