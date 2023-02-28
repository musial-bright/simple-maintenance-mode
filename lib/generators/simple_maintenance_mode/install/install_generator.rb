module SimpleMaintenanceMode
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_migration
        timestamp = Time.now.strftime('%Y%m%d%H%M%S')
        template("create_app_settings.rb", "db/migrate/#{timestamp}_create_app_settings.rb")
        template("maintenance.html", "public/maintenance.html")
      end
    end
  end
end