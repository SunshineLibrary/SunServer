class TextActivity < Activity
  has_one :text_activity_content

  accepts_nested_attributes_for :text_activity_content
end
