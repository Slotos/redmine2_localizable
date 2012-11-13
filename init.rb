# encoding: UTF-8

# This plugin should be reloaded in development mode.
if (Rails.env == "development")
  ActiveSupport::Dependencies.autoload_once_paths.reject!{|x| x =~ /^#{Regexp.escape(File.dirname(__FILE__))}/}
end

require "redmine"
require "rubygems"

# a bit of magic, models have no `name` methods prior to first instantiation
# thus leading to error with aliasing
# MAGIC start
Role.new
Tracker.new
IssueStatus.new
CustomField.new
Enumeration.new
# MAGIC end

Role.send(:include, RolePatch)
Tracker.send(:include, TrackerPatch)
IssueStatus.send(:include, IssueStatusPatch)
CustomField.send(:include, CustomFieldPatch)
Enumeration.send(:include, EnumerationPatch)

Redmine::Plugin.register :"redmine2-localizable" do
  name "Localizable plugin"
  url "https://redmine.ociotec.com/projects/localizable"
  author "Emilio González Montaña"
  author_url "http://ociotec.com"
  description "This is a plugin for Redmine that is used to show strings (issue types, issue statuses, enumerations, ...) in serveral languages"
  version "0.3.0"
  requires_redmine :version_or_higher => "2.1.0"

  settings(:default => {"default_language" => "en",
                        "locales_to_translate" => [],
                        "locales" => {"tracker" => {},
                                      "issue_status" => {}}},
           :partial => "settings/redmine2_localizable")
end
