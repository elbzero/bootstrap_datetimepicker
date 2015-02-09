class DatetimeLocalInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    input_html_options[:type] = 'datetime-local'
    input_html_options[:html5] = true
    input_html_options[:value] = value("03/23/1999") ? value("03/23/1999").strftime('%FT%R') : nil

    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    @builder.text_field(attribute_name, merged_input_options)
  end

  def value(object)
    object.send @attribute_name if object
  end

  def input_html_options
    {class: 'form-control', readonly: true, type: "date", title: "test5"}
  end

end