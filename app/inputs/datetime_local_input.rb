class DatetimeLocalInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    input_html_options[:type] = 'datetime-local'
    input_html_options[:html5] = true
    input_html_options[:currentdate] = true
    input_html_options[:value] = value("03/10/2011") ? value("03/10/2011").strftime('%FT%R') : nil
  end

  def value(object)
    object.send @attribute_name if object
  end
end
