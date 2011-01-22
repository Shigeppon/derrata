# -*- coding: utf-8 -*-
# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

ENV['RAILS_ENV'] = 'development'

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require 'gettext'

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  #config.time_zone = 'UTC'
  #config.time_zone = 'Tokyo'
  config.active_record.default_timezone = 'Tokyo' 

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = 'ja'

  config.action_controller.session = {:cookie_only => false}
end

module ActionView
  class Base
    delegate :file_exists?, :to => :finder unless respond_to?(:file_exists?)
  end
end

require 'action_view_helper'
require 'active_record_helper'
require 'will_paginate'
require 'validates'
require 'rexml-expansion-fix'
require 'create_fixtures'
require 'security_token'
require 'csv_util'

list = Dir["app/models/*.rb"]
list.each do |i|
  model = Object.const_get(File.basename(i, '.rb').camelize)
  if model.superclass == ActiveRecord::Base && model.table_exists?
    model.new
  end
end

# unsuported_device_mobile.html.erb で使用されるページネーションレンダラ
class UnsupportedDeviceLinkRenderer < WillPaginate::LinkRenderer
  def page_link(page, text, attributes = {})
    @template.link_to text, url_for(page), {}
  end

  def page_span(page, text, attributes = {})
#    @template.content_tag :span, text, {}
  end  
end

# 複数の Ruby インスタンスがひとつのログファイルを共有している状況で、
# 安全にログローテーションを実現する。
require 'fileutils'

class Logger::LogDevice

  def shift_log_age_with_safe_log_rotation
    (@shift_age-3).downto(0) do |i|
      if FileTest.exist?("#{@filename}.#{i}")
        File.rename("#{@filename}.#{i}", "#{@filename}.#{i+1}")
      end
    end
    FileUtils.cp("#{@filename}", "#{@filename}.0")
    File.truncate @filename, 0
    add_log_header(@dev)
    return true
  end

  def shift_log_period_with_safe_log_rotation(now)
    postfix = previous_period_end(now).strftime("%Y%m%d") # YYYYMMDD
    age_file = "#{@filename}.#{postfix}"
    if FileTest.exist?(age_file)
      raise RuntimeError.new("'#{ age_file }' already exists.")
    end

    FileUtils.cp("#{@filename}", age_file)
    File.truncate @filename, 0
    add_log_header(@dev)
    return true
  end

  alias_method :shift_log_age_without_safe_log_rotation, :shift_log_age
  alias_method :shift_log_age, :shift_log_age_with_safe_log_rotation
  alias_method :shift_log_period_without_safe_log_rotation, :shift_log_period
  alias_method :shift_log_period, :shift_log_period_with_safe_log_rotation
end

