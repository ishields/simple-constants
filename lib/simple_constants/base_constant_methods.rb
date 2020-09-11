module SimpleConstants
  module BaseConstantMethods
    def initialize_from_yml
      yml_constants = load_merged_ymls
      expected_keys = self.name.underscore.split('/').slice(1..-1)
      yml_constants.dig(*expected_keys).each do |constant_name, value|
        variable_name = constant_name.parameterize.underscore.upcase
        value[:code_str] = constant_name unless value[:code_str].present?
        self.const_set(variable_name, self.new(value))
      end
    end

    private

    def root_yml_dir
      File.join(Rails.root, 'lib/constants')
    end

    def load_merged_ymls
      yml_file = File.join(root_yml_dir, "#{self.name.underscore}.en.yml")
      YAML.load_file(yml_file)
    end
  end
end
