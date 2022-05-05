class PajaritoController < ApplicationController

    def index 
        response = RestClient::Request.new(
            :method => :get,
            :url => "https://aves.ninjas.cl/api/birds"
        ).execute

        @resultado = JSON.parse(response)
        @paginacion = Kaminari.paginate_array(@resultado).page(params[:page]).per(5)
    end

end
