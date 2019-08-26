# frozen_string_literal: true

class SearchPage < SitePrism::Page
  include RSpec::Mocks::ExampleMethods::ExpectHost
  include RSpec::Matchers

  element :modal_home, '.offer-box'
  element :close_modal, '.btn-close-modal'

  element :frame_home, '.search__tab__container'
  element :arriving_at, '#inptdestination'
  element :arriving_autocomplete, '#ui-autocomplete'
  element :input_date, '#departureDate'
  element :arrival_date, '#arrivalDate'
  element :start_date, '.btn-21' + (Time.now.strftime('%-m').to_i + 1).to_s + '2019'
  element :end_date, '.btn-29' + (Time.now.strftime('%-m').to_i + 1).to_s + '2019'
  element :button_search, '.btn-submit'
 
  element :button_buy, '.content-price-recommendation__btn-buy', match: :first

  def initialize
    @arrival_national = %w[Salvador Florianopolis Goiania Curitiba].sample
    @arrival_international = %w[Lisboa Dublin Barcelona].sample
  end

  def modal
    wait_until_modal_home_visible(wait: 10)
    close_modal.click
  end

  def input_search_destination(destination)
    wait_until_frame_home_visible(wait: 10)
    if destination == 'national flight'
      wait_until_arriving_at_visible(wait: 10)
      arriving_at.set @arrival_national
      wait_until_arriving_autocomplete_visible(wait: 15)
      arriving_autocomplete.click

    end
    if destination == 'international flight'
        wait_until_arriving_at_visible(wait: 10)
        arriving_at.set @arrival_international
        wait_until_arriving_autocomplete_visible(wait: 15)
        arriving_autocomplete.click
        
    end
  end

  def input_search_date
    wait_until_frame_home_visible(wait: 10)
    arriving_at.send_keys :tab
    input_date.click
    start_date.click
    end_date.click
  end
end
