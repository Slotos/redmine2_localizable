require_dependency "issue_status"
require "localizable"

module IssueStatusPatch
  def self.included(base)
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :name, :localization
    end
  end

  module InstanceMethods
    def name_with_localization(original = false)
      return(original ? name_without_localization : Localizable.localize("issue_status", id, name_without_localization))
    end
  end
end
