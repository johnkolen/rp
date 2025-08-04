module DTMissing
  def method_missing(name, *args, &block)
    case name
    when /^(.*)_str$/
      if is_field? $1
        return send($1).to_s
      end
    when /^(.*)_label$/
      if is_field? $1
        return $1.humanize
      end
    when /^(.*)_pattern$/
      if is_field? $1
        return nil
      end
    when /^(.*)_attributes$/
      if is_field?("#{$1}_type") && is_field?("#{$1}_id")
        t = send("#{$1}_type")
        return send(t.underscore) if t
        return nil
      end
    end

    return super unless dtparent

    begin
      super
    rescue NoMethodError, NameError
      dtparent.send name, *args, &block
    end
  end

  def respond_to?(name, include_private = false)
    case name
    when /^(.*)_str$/,
         /^(.*)_label$/,
         /^(.*)_pattern$/
      return true if is_field? $1
    end
    super
  end
end
