# frozen_string_literal: true

class CheckoutPage < SitePrism::Page
  include RSpec::Mocks::ExampleMethods::ExpectHost
  include RSpec::Matchers

  element :my_email, '#my-account_email'
  element :first_name, '#nome_0'
  element :last_name, '#lastName_0'
  element :date_birth, '#birth_0'
  element :gender, "select[name = 'gender_0']"
  element :male_gender, "select[name = 'gender_0'] > option:nth-child(2)"

  element :card_flag, '#flag_card'
  element :card_number, '#number_card-0'
  element :card_moth, "select[id = 'month-0']"
  element :card_year, "select[id = 'year-0']"
  element :card_name, '#name_card-0'
  element :card_document, '#cpf_card-0'
  element :card_code, '#codesecure_card-0'

  element :zip_code, '#zipcode-0'
  element :number_address, '#number_address-0'
  element :contact_email, '#contact_email'
  element :email_confirm, '#contact_email_confirm'
  element :mobile_phone, '#contact_phonenumber_0'
  element :terms, '#accept-checkout'

  element :check_out, '.btn-default.ng-scope'
  element :msg_checkout, '.message-title'

  def initialize
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @my_email = Faker::Internet.free_email
  end  

  def input_data_checkout
    switch_to_window windows.last
    
    my_email.set(@my_email)
    first_name.set(@first_name)
    last_name.set(@last_name)
    date_birth.set('10/10/1980')
    gender.click
    male_gender.click
    wait_until_male_gender_visible(wait: 10)
    # data card
    card_flag.select('Mastercard')
    card_number.set('5105921053895884')
    card_moth.select('05')
    card_year.select('2026')
    card_name.set(@first_name + @last_name)
    card_document.set(Faker::IDNumber.brazilian_citizen_number)
    card_code.set('734')
    # data address
    zip_code.set('54250-615')
    wait_until_number_address_visible(wait: 10)
    number_address.click
    number_address.set('666')
    contact_email.set(@my_email)
    email_confirm.set(@my_email)
    mobile_phone.set('1198123-4567')
    terms.click
    check_out.click
  end
end
