class TagManager

  def self.tag_ids param
    owners_tags_item = param[:joint_class].where(param[:owner_key] => param[:id].to_i).select {|item| not item.destroyed?}
    owners_tags_item.map{|item| item.tag_id}
  end

  def self.tags param
    self.tag_ids(param).map {|tag_id| Tag.find_by_id tag_id}
  end

  def self.update_tags param
    new_tag_ids = param[:new_tag_ids]
    if not new_tag_ids.nil?
      old_ids = self.tag_ids param
      for temp_id in old_ids
        if not new_tag_ids.include? temp_id
          btitem = param[:joint_class].where(param[:owner_key] => param[:id], :tag_id => temp_id).first
          btitem.soft_destroy
        end
      end
      for temp_id in new_tag_ids
        if not old_ids.include? temp_id
          param[:joint_class].create param[:owner_key] => param[:id], :tag_id => temp_id
        end
      end
    end
    true
  end
end