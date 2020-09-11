module SimpleConstants
  class Status < BaseConstant
    DRAFT = new(code_str: 'draft')
    PUBLISHED = new(code_str: 'published')
    DELETED = new(code_str: 'deleted')

    def display_name
      code_str.titleize
    end
  end
end
