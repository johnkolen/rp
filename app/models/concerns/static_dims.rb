module StaticDims
  extend ActiveSupport::Concern

  included do |klass|
    def klass.static_dim key, **values
      key_const = key.to_s.upcase
      key_camel = key.to_s.camelize

      const_set key_const, values

      values.each do |id, label|
        ulabel = label.gsub(" ", "_")
        define_method "#{ulabel.downcase}?" do
          send("#{key}_id") == id
        end
        const_set "#{key_camel}#{ulabel.camelize}", id
      end

      define_method "#{key}_label" do
        key_camel.titleize
      end

      define_method "#{key}_sym" do
        key_const.constantize[send("#{key}_id")].
          gsub(" ", "_").downcase.to_sym
      end

      define_method "#{key}_str" do
        key_const.constantize[send("#{key}_id")]
      end

      define_method "#{key}_options" do
        key_const.constantize.map { |k, v| [ v, k ] }
      end

    end
  end
end
