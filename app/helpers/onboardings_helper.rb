module OnboardingsHelper

  ONBOARDING_FIELDS = {
    primary_contact_information: {
      name: :string,
      email: :email,
      phone: :phone,
      home_address: :string,
    },
    specific_business_information: {
      hours_of_operation: :text,
      creation_date: :date,
      business_type: :string,
      core_values: :text,
      number_of_locations: :integer,
      primary_service_areas: :text,
      secondary_service_areas: :text,
      number_of_employees: :integer,
      summary_of_history: :text,
      unique_selling_proposition: :text,
      unique_training_programs_proposition: :text,
    },
    # training_programs: {},
    # team_members: {},

  }

  ONBOARDING_FIELD_LABELS = {
    name: "This will be the primary point of contact on your account",
    email: "We will use this email for all communications",
    phone: "What phone number should the Right Rudder Team use to reach you?",
    home_address: "We're sending you a welcome package!",

    hours_of_operation: "Ex: Mon-Fri 8am-6pm",
    creation_date: "When was your business founded?",
    business_type: "Ex: LLC, Corporation, Sole Proprietorship",
    core_values: "List your company's core values.",
    number_of_locations: "How many locations do you have?",
    primary_service_areas: "Order By Importance: Please enter cities, NOT counties or townships.",
    secondary_service_areas: "Order By Importance: Please enter cities, NOT counties or townships.",
    number_of_employees: "How many employees do you have?",
    summary_of_history: "Please provide a brief summary of how your flight school came into being",
    unique_selling_proposition: "What makes your flight school business special and different compared to other flight schools?",
    unique_training_programs_proposition: "Please let us know anything unique about your training program / syllabus. Ex: accelerated or flexible courses",
  }

  def dynamic_jsonb_form(form, jsonb_field)
    fields = ONBOARDING_FIELDS[jsonb_field]

    fields.map do |field, field_type|
      label = form.label field.to_sym, field.to_s.humanize
      subtitle = ONBOARDING_FIELD_LABELS[field] ? content_tag(:p, ONBOARDING_FIELD_LABELS[field], class: "text-sm text-gray-500 mt-1") : ""
      input = case field_type
              when :string
                form.text_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :integer
                form.number_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :email
                form.email_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :phone
                form.telephone_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :text
                form.text_area field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :date
                form.date_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              # Add more field types as needed
              end
      content_tag(:div, class: "my-5") do
        label + subtitle + input
      end
    end.join.html_safe
  end
end
