class SearchPage < SitePrism::Page
    element :modal_home, '#checkoutAbandon'
    element :close_modal, '.btn-close-modal'
    element :arriving_at, '#inptdestination'
    element :arriving_autocomplete, '#ui-autocomplete'
    element :departure_date, '#departureDate'
    element :arrival_date, '#arrivalDate'
    element :button_search, '.btn-submit'
    
end

def initialize
    @arrival_national = %w[Salvador Florianopolis Goiania Curitiba].sample
    @arrival_international = %w[Lisboa  Dublin Barcelona].sample
end

def modal
    if @modal == wait_until_modal_home_visible
        close_modal.click
        
    else 
        puts "Modal not present"
        
    end
    
end

def imput_search_data(destination)
    if destination == "national flight" 
       arriving_at.set(@arrival_national)
    end

    if destination == "international flight"
       arriving_at.set(@arrival_international)
        
    end
    
end