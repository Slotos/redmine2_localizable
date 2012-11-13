require_dependency "role"
require "localizable"

module RolePatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def name(original = false)
      return(original ? super() : Localizable.localize("role", id, super()))
    end
  end
end
