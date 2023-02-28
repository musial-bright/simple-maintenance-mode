require 'active_record'
require 'acts_as_singleton'

module MaintenanceMode
  module Model
    class AppSettings < ActiveRecord::Base
      
      acts_as_singleton
      
      def self.maintenance_mode=(active=false)
        app_settings = MaintenanceMode::Model::AppSettings.instance
        app_settings.maintenance_mode = active
        app_settings.save
      end

      def self.maintenance_mode
        MaintenanceMode::Model::AppSettings.instance.maintenance_mode
      end
      
      def as_json
        {
          maintenance_mode: self.maintenance_mode
        }
      end

    end
  end
end