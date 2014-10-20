# NamespacedMixin

Namespaces your mixins. Proper Composition.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'namespaced_mixin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install namespaced_mixin

## Usage
You can do such amazing things:

```ruby
require 'namespaced_mixin'

module TestModule
  module NestedModule
    def do_that
      puts 'Do everything'
    end
  end
end

module TestModule1
  def do_that
    puts 'Doing that'
  end

  def do_other
    puts 'Doing that'
  end
end

module TestModule2
  def do_that
    puts 'Do this and that'
  end
end

class Example
  include NamespacedMixin

  namespace 'TestModule1', as: :simply
  namespace 'TestModule2', as: :namespaced
  namespace 'TestModule::NestedModule', as: :mixins

  include AmazingModule

  #rest of the code
end

ex = Example.new
ex.simply.do_that #Doing that
ex.mixins.do_that #Do everything
ex.namespaced.do_that #Do this and that

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/namespaced_mixin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
