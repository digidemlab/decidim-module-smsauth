# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/smsauth/version"

Gem::Specification.new do |s|
  s.version = Decidim::Smsauth.version
  s.authors = ["Digidem Lab"]
  s.email = ["rupus@digidemlab.org"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/digidemlab/decidim-module-smsauth"
  s.required_ruby_version = ">= 3.1"

  s.name = "decidim-smsauth"
  s.summary = "A decidim smsauth module"
  s.description = "SMS based authentication implementation."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::Smsauth.decidim_version
  s.add_dependency "phonelib", "~> 0.10.13"
  s.add_dependency "decidim-sms-infobip", Decidim::Smsauth.decidim_version
  s.metadata["rubygems_mfa_required"] = "true"
end
