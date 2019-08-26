# frozen_string_literal: true

Given('I have successfully navigated to the Viajanet') do
  @home = HomePage.new
  @home.load
end

When('I fill in the data going to {string} and do a search') do |destination|
  @search_data = SearchPage.new
  @search_data.modal
  @search_data.input_search_destination(destination)
end

When('I fill in the date to start and') do
  @search_data.input_search_date
  @search_data.wait_until_frame_home_visible(wait: 10)
  @search_data.button_search.click
end

When('I choose a result of flight') do
  @choose_flight = SearchPage.new
  @choose_flight.wait_until_button_buy_visible(wait: 10)
  @choose_flight.button_buy.click
end

When('I fill in the passenger and payment data') do
  @input_checkout = CheckoutPage.new.input_data_checkout
end

Then('I validate the processing of purchase') do
  @input_checkout = CheckoutPage.new.wait_until_msg_checkout_visible(wait: 20)
  @input_checkout = CheckoutPage.new.msg_checkout.click
  assert_text('Reserva em processamento.')
end
