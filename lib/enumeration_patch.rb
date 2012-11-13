require_dependency "enumeration"
require "localizable"

module EnumerationPatch
  def self.included(base)
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :name, :localization
    end
  end

  module InstanceMethods
    def name_with_localization(original = false)
      return(original ? name_without_localization : Localizable.localize("enumeration", id, name_without_localization))
    end
  end
end
