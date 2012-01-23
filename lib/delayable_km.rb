require "delayable_km/version"

# delayable_km: A minimal wrapper for the KISSmetrics API that can be used with delayed_job
#
# @see https://github.com/kissmetrics/km The official KISSmetrics Ruby gem: km
# @see http://support.kissmetrics.com/apis/specifications The official KISSmetrics API specification
# @see http://support.kissmetrics.com/apis/api-tips Tips for using the KISSmetrics API
# @see http://support.kissmetrics.com/apis/common-methods Commonly used API calls
# @see http://support.kissmetrics.com/apis/ruby-specific#basic-rails-integration Tips for integrating the KISSmetrics Ruby and Javascript APIs with Rails
module DelayableKm
  require 'delayable_km/km'
end
