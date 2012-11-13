module Localizable

  def self.localize(type, id, name)
    value = name
    Setting["plugin_localizable"] and
      Setting["plugin_localizable"]["locales"] and
      Setting["plugin_localizable"]["locales"][type] and
      Setting["plugin_localizable"]["locales"][type][id.to_s] and
      not Setting["plugin_localizable"]["locales"][type][id.to_s][User.current.language.to_s].blank? and
      value = Setting["plugin_localizable"]["locales"][type][id.to_s][User.current.language.to_s]
    return(value)
  end

end
