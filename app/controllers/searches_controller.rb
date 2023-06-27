class SearchesController < ApplicationController
  
    def search
    
    @word = params[:word]
    
    @items = Item.looks(partial_match, @word)
    
    end
  
end
