class MatchesController < ApplicationController
    def index 
        @matches = Match.all.reverse
    end
end
