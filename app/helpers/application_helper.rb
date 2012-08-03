# encoding: UTF-8

module ApplicationHelper
  
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
  
  def link_to_add(name, path, options={})
    default_options = { :class => "btn" }
    link_to path, options.merge(default_options) do
      content_tag(:i, "", :class => "icon-share-alt icon-white") + " " + name
    end
  end
end