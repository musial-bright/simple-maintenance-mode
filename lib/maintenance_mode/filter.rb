module MaintenanceMode
  module Filter
    
    def check_maintenance_mode(override = false)
      maintenance_mode_override = override
      if params[:maintenance_mode_override].present?
        maintenance_mode_override = true
        cookies[:maintenance_mode_override] = true
      end
      if cookies[:maintenance_mode_override].present?
        maintenance_mode_override = true
      end

      if app_settings.maintenance_mode.present? && !maintenance_mode_override
        redirect_to '/maintenance'
      end
      if app_settings.maintenance_mode.blank?
        cookies.delete(:maintenance_mode_override) # cleanup unused cookie
      end
    end
    
    def app_settings
      @app_settings ||= MaintenanceMode::Model::AppSettings.instance
    end
  end
end