@logger = Logger.new(STDOUT)

def log(msg)
  @logger.info "#{msg}\n"
end

log "pages/welcome_level_three_verified"
require_relative "pages/welcome_level_three_verified"
log "pages/welcome_level_two_verified"
require_relative "pages/welcome_level_two_verified"
log "pages/welcome_not_verified"
require_relative "pages/welcome_not_verified"
log "pages/accessibility"
require_relative "pages/accessibility"
log "pages/conditions"
require_relative "pages/conditions"
log "pages/privacy"
require_relative "pages/privacy"
log "pages/faq"
require_relative "pages/faq"
log "Done!"
