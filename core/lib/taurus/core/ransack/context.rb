module Ransack
  class Context
    def unpolymorphize_association(str)
      if (match = str.match(/_of_([^_]+?)_type$/))
        [match.pre_match, class_from_string(match.captures.first)]
      else
        [str, nil]
      end
    end

    private
      def class_from_string(str)
        str.split('::').inject(Object) do |mod, class_name|
          mod.const_get(class_name)
        end
      end
  end
end