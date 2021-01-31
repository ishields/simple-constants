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
      File.join(SimpleConstants.root, SimpleConstants.yml_path)
    end

    def load_merged_ymls
      base_path = File.join(root_yml_dir, "#{self.name.underscore.gsub('simple_constants', '')}")
      single_yml_file = "#{base_path}.en.yml"
      file_paths = Dir["#{base_path}/*.en.yml"]
      file_paths << single_yml_file if File.exist?(single_yml_file)

      file_paths.each_with_object({}) do |file_path, hash|
        begin
          hash.deep_merge! YAML.load_file(file_path)
        rescue
          raise StandardError.new("Failed to Load constants yml file at #{yml_file}")
        end
      end
    end
  end
end
