##
# Better Errors plugin on Padrino
#
# https://github.com/grogui/better_errors
# forked from https://github.com/charliesome/better_errors
#

GEMFILE = <<-GEMFILE

# Better Errors
group :development do
  gem "better_errors"
end

GEMFILE
append_file("Gemfile", GEMFILE)

CONFIG = <<-CONFIG

# Setup better_errors
if Padrino.env == :development
  Padrino::Application.use BetterErrors::Middleware
  BetterErrors.application_root = PADRINO_ROOT
  BetterErrors.logger = Padrino.logger
end
CONFIG

inject_into_file destination_root('config/boot.rb'), CONFIG, :after => "Bundler.require(:default, PADRINO_ENV)\n"
