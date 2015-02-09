class DatetimeLocalInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    input_html_options[:type] = 'datetime-local'
    input_html_options[:html5] = true
    input_html_options[:currentdate] = true
    input_html_options[:value] = value(object) ? value(object).strftime('%FT%R') : nil

    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    @builder.text_field(attribute_name, :"data-current-date" => "Test", value: "123")
  end

  def value(object)
    object.send @attribute_name if object
  end
end
