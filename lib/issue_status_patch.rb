require_dependency "issue_status"
require "localizable"

module IssueStatusPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def name(original = false)
      return(original ? super() : Localizable.localize("issue_status", id, super()))
    end
  end
end
