class SpicesController < ApplicationController

    def index 
        render json: Spice.all
    end 

    def create 
        new_spice = Spice.new(spice_params)
        if new_spice.save 
            render json: new_spice,
            status: :created 
        else 
            render json: new_spice.errors,
            status: :unprocessable_entity
        end 
    end 

    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end 

    def destroy 
        spice = find_spice
        spice.destroy
        head :no_content
    end 

    private 

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, 
                      :image, 
                      :description, 
                      :notes, 
                      :rating)
    end 

end
