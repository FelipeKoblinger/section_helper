module SectionHelper
  class SectionHtml
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Context

    def initialize(name, options = {})
      @tables = []
      @section_name = name
      @section_options = options
      yield self if block_given?
    end

    def column(header, information, options = {})
      @column = { header: header, information: information, options: options}
      @tables.last[:columns] << @column
    end

    def table(options = {}, &block)
      @table = { columns: [], options: options }
      @tables << @table
      yield self if block_given?
    end

    def section_html(&block)
      section_class = @section_options.key?(:class) ? @section_options[:class] : 'panel panel-info'

      content_tag(:div, class: section_class) do
        concat content_tag(:div, class: 'panel-heading') {
                 concat content_tag(:h3, class: 'panel-title') {
                          icon = @section_options.delete(:icon)
                          concat(content_tag(:i, '', class: "#{icon} fa-right-space")) if icon
                          concat(@section_name)
                        }
               }
        concat content_tag(:div, class: 'panel-body') {
                 yield
               }
      end
    end

    def table_html(collection, slices)
      concat content_tag(:div, class: 'table-responsive') {
               concat content_tag(:table, class: 'table table-striped table-bordered table-hover') {
                        # Header
                        concat content_tag(:thead) {
                                 concat content_tag(:tr) {
                                          collection[0..(slices-1)].each do |column|
                                            icon = column[:options].key?(:icon) ? column[:options].delete(:icon) : ''
                                            concat content_tag(:th) {
                                                     concat(content_tag(:i, '', class: "#{icon} fa-right-space"))
                                                     concat(column[:header])
                                                   }
                                          end
                                        }
                               }

                        # Body
                        concat content_tag(:tbody) {
                                   collection.each_slice(slices) do |columns|
                                   concat content_tag(:tr) {
                                            columns.each do |column|
                                              concat content_tag(:td, column[:information])
                                            end
                                          }
                                   end
                               }

                      }
             }
    end

    def html
      section_html do
        @tables.each do |table|
          slices = table[:options].key?(:columns) ? table[:options].delete(:columns) : table[:columns].size
          table_html(table[:columns], slices)
        end
      end
    end

  end
end