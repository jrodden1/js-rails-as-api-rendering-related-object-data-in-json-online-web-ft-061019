class SightingsController < ApplicationController
   def show
      sighting = Sighting.find_by(id: params[:id])
      # render json: sighting
      # explicit=>  render json: { id: sighting.id, bird: sighting.bird, location: sighting.location } 
      # use include=> 
      
      if sighting 
         render json: sighting, include: [:bird, :location]
      
      #If i wanted to limit what attributes of my nested models I could do something like this:
      # render json: sighting.to_json(:include => {
      #    :bird => {:only => [:name, :species]},
      #    :location => {:only => [:latitude, :longitude]}
      #  }, :except => [:updated_at])
      
      else 
         render json: { message: 'No sighting found with that id' }
      end

    end
end
