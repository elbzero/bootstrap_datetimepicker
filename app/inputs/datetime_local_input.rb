class DatetimeLocalInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    @builder.text_field(attribute_name, input_html_options)
  end

  def value(object)
    object.send @attribute_name if object
  end

  def input_html_options
    {class: 'form-control', readonly: true, type: "date", title: "test7"}
  end

end