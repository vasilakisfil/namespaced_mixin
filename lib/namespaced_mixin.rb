require "namespaced_mixin/version"

module NamespacedMixin
  module ClassMethods
    def namespace(name, as:)
      namespace = as

      namespaced_class = name.split('::').inject(Object) {|o,c| o.const_get c}
      cls = Class.new{
        include namespaced_class
      }.new

      define_method("#{namespace}") do
        cls
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
