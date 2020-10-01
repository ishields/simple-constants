module SimpleConstants
  private
  class BaseConstant
    extend SimpleConstants::BaseConstantMethods

    protected

    def initialize(hash = {})
      @data = {}
      @data.merge! hash unless hash.nil?
      @data.transform_keys!(&:to_s)

      if self.class.const_defined? 'ALL', false
        self.class.const_get(:ALL).push(self)
      else
        self.class.const_set(:ALL, [self])
      end

      @data.keys.each do |key|
        unless self.respond_to? "#{key}"
          self.class.class_eval(%Q{
              def #{key}(*args)
                result = data(:#{key})
                if result.respond_to?(:call)
                  result = instance_exec(*args, &result)
                end
                result
              end
            })
        end
      end
    end

    public

    def self.find_by_code(k)
      self.const_get(:ALL).find { |type| k.to_s == type[:code].to_s }
    end

    def [](key)
      data(key)
    end

    def data(key)
      @data[key.to_s]
    end

    def to_hash
      @data.clone
    end

    # Looks up translation based on class name and code_str
    # def t(field, options = {})
    #   options ||= {}
    #   scope = self.class.to_s.split('::')[1..-1].map(&:underscore) + [code_str]
    #   I18n.t(field, options.merge(scope: scope, default: nil))
    # end
  end
end
