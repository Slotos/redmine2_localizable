require_dependency "enumeration"
require "localizable"

module EnumerationPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def name(original = false)
      return(original ? super() : Localizable.localize("enumeration", id, super()))
    end
  end
end
