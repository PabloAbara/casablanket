class HomeController < ApplicationController
    before_action :authenticate_user!

    def index 
        
        @assigns = Assign.all.filter { |a| a.user_id == current_user.id }
        
        @aux = @assigns.pluck(:id)

        @offers = Offer.all.filter { |a| a.assign_id in aux }

    end

end
