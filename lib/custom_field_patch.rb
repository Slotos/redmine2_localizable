require_dependency "custom_field"
require "localizable"

module CustomFieldPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def name(original = false)
      return(original ? super() : Localizable.localize("custom_field", id, super()))
    end
  end
end
