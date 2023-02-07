class ScientistsController < ApplicationController
def index
        render json: Scientist.all
    end
    def show
        scientist = findscientist
        render json: scientist, serializer:ScientistPlanetsSerializer
    end
    def create
        scientist = Scientist.create!(permit_params)
        render json: scientist, status: 201
    end
    def update
        scientist = findscientist
        scientist.update!(permit_params)
        render json: scientist, status: :accepted
    end
    def destroy
        scientist = findscientist
        scientist.destroy
        head :no_content
    end


private

    
    def permit_params
        params.permit( :name, :field_of_study, :avatar)
    end
    def findscientist
        Scientist.find(params[:id])
    end
end
