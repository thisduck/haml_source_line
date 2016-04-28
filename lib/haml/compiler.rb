# taken and modified from: https://github.com/redgetan/rails_panel/tree/views_with_line_number
# with credits to redgetan

module Haml
  class Compiler

    alias_method :orig_compile, :compile

    def compile(node)
      if node.type == :tag
        file = @options[:filename]
        if defined?(Rails)
          file.gsub!(Rails.root, "")
        end

        node.value.attributes.merge!(:data => { :source_line => "#{file}:#{node.line}" })
      end
      orig_compile(node)
    end

  end
end
