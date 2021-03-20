class HomeController < ApplicationController
    def index
        @tinyurl = Tinyurl.new
    end
end