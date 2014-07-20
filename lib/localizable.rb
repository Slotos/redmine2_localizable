module Localizable

  def self.localize(type, id, name)
    value = name
    Setting["plugin_redmine2_localizable"] and
      Setting["plugin_redmine2_localizable"]["locales"] and
      Setting["plugin_redmine2_localizable"]["locales"][type] and
      Setting["plugin_redmine2_localizable"]["locales"][type][id.to_s] and
      not Setting["plugin_redmine2_localizable"]["locales"][type][id.to_s][I18n.locale].blank? and
      value = Setting["plugin_redmine2_localizable"]["locales"][type][id.to_s][I18n.locale]
    return(value)
  end

end
