class TinyurlsController < ApplicationController
    def index
        @tinyurls = Tinyurl.all
    end
    
    def show
        redirect_to root_path if params[:id].nil?

        tinyurl = Tinyurl.find_by(token: params[:id])
        
        ip_address = request.remote_ip
        Visit.create(ip_address: ip_address, tinyurl_id: tinyurl.id)
        byebug
        
        redirect_to tinyurl.url
    end

    def create
        @tinyurl = Tinyurl.new(tinyurl_params)
        if @tinyurl.save 
            redirect_to "/#{@tinyurl.token}/info" 
        else
            render 'home/index'
        end
    end

    def info
        @tinyurl = Tinyurl.find_by(token: params[:id])
        @number_of_visits = Visit.by_token(params[:id]).count
        @distinct_ips = Visit.distinct_ips(params[:id])
        @fulltinyurl = request.base_url + "/" + @tinyurl.token
    end

    private

    def tinyurl_params
        params.require(:tinyurl).permit(:url, :token)
    end
end