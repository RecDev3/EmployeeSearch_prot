# in config/initializers/modify_Rails_form_builder.rb
# This will add a new method in the `f` object available in Rails forms
class ActionView::Helpers::FormBuilder
  def error_message_for(field_name)
    if self.object.errors[field_name].present?
      model_name              = self.object.class.name.downcase
      id_of_element           = "error_#{model_name}_#{field_name}"
      target_elem_id          = "#{model_name}_#{field_name}"
      class_name              = 'input-error alert alert-warning'
      error_declaration_class = 'has-input-error'

      "<div id=\"#{id_of_element}\" for=\"#{target_elem_id}\" class=\"#{class_name}\">"\
      "#{self.object.errors[field_name].join('<br> ')}"\
      "</div>"\
      "<!-- Later JavaScript to add class to the parent element -->"\
      "<script>"\
          "document.onreadystatechange = function(){"\
            "$('##{id_of_element}').parent()"\
            ".addClass('#{error_declaration_class}');"\
            "\n"\
          "}"\
      "</script>".html_safe
    end
  rescue
    nil
  end
end