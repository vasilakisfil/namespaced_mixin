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
      puts 'Do this'
    end
  end
end

module TestModule1
  def do_that
    puts 'Doing that'
  end
end

module TestModule2
  def do_that
    puts 'Do something else'
  end
end

class Example
  include NamespacedMixin

  namespace 'TestModule1', as: :simply
  namespace 'TestModule2', as: :namespaced
  namespace 'TestModule::NestedModule', as: :mixins

  include AmazingModule

  #rest of the code
  
  def stupid_method
    if simply.do_that == mixins.do_that
      namespaced.do_that #do something else
    end
  end
end
```

Usually the methods of the mixins that you want to use should not keep state (act like traits),
and support DI.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/namespaced_mixin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
