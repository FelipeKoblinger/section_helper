# SectionHelper

This is a very simple gem to use with Bootstrap 3 panels.

TODO: Make better tests (and more). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'section_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install section_helper

## Usage

The usage is simple, in view do (Slim example):

```ruby
= sector_information('Name', icon: 'fa fa-user') do
    - t.table do
        - t.column 'Customer', @customer.name, icon: 'fa fa-user'
        - t.column 'Age', @customer.age
```

This piece of code will generate:

```html
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="fa fa-user fa-right-space"></i>
                Cliente
            </h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>
                                <i class="fa fa-user fa-right-space"></i>
                                Name
                            </th>
                            <th>
                                Age 
                            </th>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>A cool customer</td>
                            <td>23 old years</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
```

## Contributing

1. Fork it ( https://github.com/FelipeKoblinger/section_helper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request