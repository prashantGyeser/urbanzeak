class Subdomain
  def self.matches?(request)
    #request.subdomain.present? && request.subdomain != "www"
    case request.subdomain
      when 'www', '', nil, 'admin'
        false
      else
        true
    end
  end
end