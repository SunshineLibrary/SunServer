# encoding: UTF-8

module ApplicationHelper
  
  ########################################
  #
  # view generator for buttons with icon
  #
  ########################################
  
  def link_to_check(name, path, options={})
    default_options = { :class => "btn btn-primary" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-search icon-white") + " " + name
    end
  end
  
  def link_to_edit(name, path, options={})
    default_options = { :class => "btn btn-primary" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-pencil icon-white") + " " + name
    end
  end
  
  def link_to_delete(name, path, options={})
    default_options = { :class => "btn btn-danger" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-trash icon-white") + " " + name
    end
  end
  
  def link_to_confirm(name, path, options={})
    default_options = { :class => "btn btn-success" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-ok icon-white") + " " + name
    end
  end
  
  def link_to_add(name, path, options={})
    default_options = { :class => "btn btn-success" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-plus icon-white") + " " + name
    end
  end
  
  def link_to_back(name, path, options={})
    default_options = { :class => "btn" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-share-alt icon-white") + " " + name
    end
  end
  
  def form_field(name, label, form_builder, method)
    html = "<div class=\"control-group\">"
    html << form_builder.label(name, label, class: "control-label")
    html << "<div class=\"controls\">"
    html << form_builder.send(method, name)
    html << "</div></div>"
    raw(html)
  end
  
  def file_status(file_owner, file_name)
    if file_owner.send("#{file_name}?")
      "(已上传(#{file_owner.send("#{file_name}_file_name")}))"      
    else
      "(未上传)"
    end
  end
end