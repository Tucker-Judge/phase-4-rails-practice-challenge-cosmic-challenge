class MissionsController < ApplicationController

    def create
        mission = Mission.create!(permit_params)
        render json: mission.planet, status: :created
    end

    private
    def permit_params
        params.permit(:name, :scientist_id, :planet_id)
    end
   
end


