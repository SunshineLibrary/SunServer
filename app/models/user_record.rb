class UserRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :polymorphic => true

  def self.find_record(user_id, item_id, item_type)
    UserRecord.where("user_id" => user_id, "item_id" => item_id, "item_type" => item_type).order("created_at").first
  end
  
  def self.get_first_record(user_id, item_id, item_type)
    self.find_record(user_id, item_id, item_type)
  end

  def self.update_or_create_record(user, record_hash)
    item_type = record_hash["item_type"]
    item_id = record_hash["item_id"]
    item = get_item item_type, item_id
    if item
      case item_type
      when /Problem/
        create(user_id: user.id, item_id: item_id, item_type: item_type,
               timestamp: record_hash[:timestamp].to_i, params: sanitize_params(record_hash))
      when /Activity|Book|Section/
        record = find_record(user.id, item_id, item_type)
        if record
          record.update_attributes(timestamp: record_hash[:timestamp], params: sanitize_params(record_hash))
        else
          create(user_id: user.id, item_id: item_id, item_type: item_type,
               timestamp: record_hash[:timestamp].to_i, params: sanitize_params(record_hash))
        end
      end
    end
  end

  def self.get_item(item_type, item_id)
    case item_type
    when "Problem"
      Problem.find item_id
    when "Activity"
      Activity.find item_id
    when "Book"
      Book.find item_id
    when "Section"
      Section.find item_id
    else
      nil
    end
  end

  def self.sanitize_params(options={})
    filter = param_filter(options["item_type"])
    if filter
      options["params"].select(&filter).to_json
    else
      "{}"
    end
  end

  @@param_filters = {}
  def self.param_filter(item_type)
    case item_type
    when "Problem"
      @@param_filters["Problem"] ||= Proc.new {|key, value| /answer|is_correct|duration/.match key}
    when "Activity"
      @@param_filters["Activity"] ||= Proc.new {|key, value| /result|status/.match key}
    when "Book"
      @@param_filters["Book"] ||= Proc.new {|key, value| /percent|status/.match key}
    when "Section"
      @@param_filters["Book"] ||= Proc.new {|key, value| /status/.match key}
    else
      nil
    end
  end
  
  def get_params_as_hash
    JSON.parse self.params
  end
  
end
