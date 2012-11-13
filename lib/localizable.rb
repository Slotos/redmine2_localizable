module Localizable

  def self.localize(type, id, name)
    value = name
    Setting["plugin_localizable"].nil? and
      Setting["plugin_localizable"]["locales"].nil? and
      Setting["plugin_localizable"]["locales"][type].nil? and
      Setting["plugin_localizable"]["locales"][type][id.to_s].nil? and
      Setting["plugin_localizable"]["locales"][type][id.to_s][User.current.language.to_s].blank? and
      value = Setting["plugin_localizable"]["locales"][type][id.to_s][User.current.language.to_s]
    return(value)
  end

end
