# config/initializers/onboarding_form_config.rb
ONBOARDING_FIELDS = {
  primary_contact_information: {
    first_name: :string,
    last_name: :string,
    email: :string,
    phone: :string
  },
  specific_business_information: {
    business_name: :string,
    industry: :string,
    business_size: :integer
  }
}
