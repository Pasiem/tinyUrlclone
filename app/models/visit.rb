class Visit < ApplicationRecord
    belongs_to :tinyurl

    scope :by_token, -> (token) { joins(:tinyurl).where( tinyurls: {token: token})}

    scope :distinct_ips, -> (token) { by_token(token).group(:ip_address) }

end
