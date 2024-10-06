module OnboardingsHelper
  def dynamic_jsonb_form(form, jsonb_field)
    fields = ONBOARDING_FIELDS[jsonb_field]
  
    fields.map do |field, field_type|
      label = form.label field.to_sym, field.to_s.humanize
      input = case field_type
              when :string
                form.text_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :integer
                form.number_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :email
                form.email_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              when :phone
                form.telephone_field field.to_sym, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full"
              # Add more field types as needed
              end
  
      # Wrap each field with a div and output the label and input together
      content_tag(:div, class: "my-5") do
        label + input
      end
    end.join.html_safe
  end
end
