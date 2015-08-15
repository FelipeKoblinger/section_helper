module SectionHelper
  module Helper
    def section_for(name, options = {}, &block)
      SectionHtml.new(name, options, &block).html
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include SectionHelper::Helper
end