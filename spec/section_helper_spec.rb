require 'spec_helper'
include SectionHelper::Helper

describe SectionHelper do
  it 'must generate a simple complete section' do
    rendered = section_for('Important Stuff', icon: 'fa fa-important') do |sf|
      sf.table do
        sf.column 'Top Secret ID', 1, icon: 'fa fa-top-secret'
        sf.column 'Description', 'The secret of the Universe', icon: 'fa fa-secret-universe'
      end
    end

    expect(rendered).to have_tag('div', with: { class: 'panel panel-info'}) do
      with_tag 'div', with: { class: 'panel-heading' } do
        with_tag 'h3', with: { class: 'panel-title' } do
          with_text 'Important Stuff'
          with_tag 'i', with: { class: 'fa fa-important fa-right-space' }
        end

        with_tag 'div', with: { class: 'panel-body' } do
          with_tag 'div', with: { class: 'table-responsive' } do
            with_tag 'table', with: { class: 'table table-striped table-bordered table-hover' } do
              with_tag 'thead' do
                headers = [{ header: 'Top Secret ID', icon: 'fa fa-top-secret' },
                           { header: 'Description', icon: 'fa fa-secret-universe' }]
                headers.each do |header|
                  with_tag 'th' do
                    with_text header[:header]
                    with_tag 'i', with: { class: "#{header[:icon]} fa-right-space" }
                  end
                end
              end
              with_tag 'tbody' do
                with_tag 'tr' do
                  contents = [1, 'The secret of the Universe']
                  contents.each do |content|
                    with_tag 'td' do
                      with_text content
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
