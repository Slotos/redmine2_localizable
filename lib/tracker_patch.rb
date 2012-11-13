require_dependency "tracker"
require "localizable"

module TrackerPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def name(original = false)
      return(original ? super() : Localizable.localize("tracker", id, super()))
    end
  end
end
