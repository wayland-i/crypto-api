class ApiController < ApplicationController

    #GET
    def products

        response = HTTParty.get('https://dummyjson.com/products')
        render json: response.body

        # products = https://dummyjson.com/products
        # render json: products
        # render plain: 'hello'
    end

    #GET
    def cmc_api
        api_key = ENV['API_KEY']
        response = HTTParty.get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?slug=bitcoin', headers: {'X-CMC_PRO_API_KEY' => api_key})
        
        #this is the correct syntax, do not submit like this {data: response.body}
        render json: response.body

        #this was my best attempt before I found the 'rack-cors' gem
        #render json: {data: response.body}, headers: {'Access-Control-Allow-Origin' => 'http://localhost:4000'}
    end


    def daily

        # Time.zone = 'Eastern Time (US & Canada)'

        # now = Time.zone.now

        # start_time = now - 24.hours

        # start_time_str = start_time.strftime('%Y-%m-%dT%H:%M:%SZ')
        # end_time_str = now.strftime('%Y-%m-%dT%H:%M:%SZ')

        # https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?slug=bitcoin
        # url = URI("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/historical?symbol=BTC&time_start=#{start_time_str}&time_end=#{end_time_str}")

        # render json: now

        api_key = ENV['API_KEY']
        response = HTTParty.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/historical?symbol=BTC&time_start=2023-02-19T00:00:00Z&time_end=2023-02-19T23:59:59Z", headers: {'X-CMC_PRO_API_KEY' => api_key})
        
        render json: response.body

    end


end