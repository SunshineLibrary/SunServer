module ApiModelHelper  
  DEFAULT_LIMIT = 100

  def self.parse_params (params)
    timestamp = params[:timestamp] ? params[:timestamp].to_i : 0
    limit = params[:limit] ? params[:limit].to_i : DEFAULT_LIMIT

    [timestamp, limit]
  end

  def self.sequence_after (container_class, timestamp, limit)
    sorted_sequence = container_class.select{|b| b.updated_at.to_i > timestamp}.sort{|a,b| a.updated_at <=> b.updated_at}
    return ApiModelHelper.cut(sorted_sequence, limit)
  end

  def self.cut (sequence, limit)
    return sequence if sequence.count <= limit
    #sequence is longer than limit, must cut down
    i = limit
    while sequence[i] && sequence[i].updated_at == sequence[limit-1].updated_at
      i = i + 1
    end
    return sequence[0, i]
  end
  
end
