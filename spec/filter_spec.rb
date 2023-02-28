require 'spec_helper'

describe 'SimpleMaintenanceMode::Filter' do
  
  let(:app_settings) do
    double(SimpleMaintenanceMode::Model::AppSettings)
  end
  
  let(:generic_controller) do
    class GenericController
      include SimpleMaintenanceMode::Filter
      
      attr_accessor :cookies, :params
      
      def initialize
        @cookies = Hash.new
        @params = Hash.new
      end
      
      def redirect_to
      end
    end
    gc = GenericController.new
    gc.stub(:app_settings).and_return(app_settings)
    gc
  end
  
  def maintenace_mode_activated
    app_settings.stub(maintenance_mode: true)
  end

  def maintenace_mode_deactivated
    app_settings.stub(maintenance_mode: false)
  end
  
  describe 'with deactivated maintenance mode' do
    before :each do
      maintenace_mode_deactivated
    end
    it 'should not redirect' do
      generic_controller.should_not_receive(:redirect_to)
      generic_controller.check_maintenance_mode
    end
  end
  
  describe 'with activated maintenance mode' do
    before :each do
      maintenace_mode_activated
    end
    
    it 'should redirect' do
      generic_controller.should_receive(:redirect_to)
      generic_controller.check_maintenance_mode
    end
    
    describe 'overridden check with method attribute' do
      it 'should not redirect' do
        generic_controller.should_not_receive(:redirect_to)
        generic_controller.check_maintenance_mode(true)
      end 
    end
    
    describe 'overridden check with get params' do
      it 'should not redirect' do
        generic_controller.should_not_receive(:redirect_to)
        generic_controller.params[:maintenance_mode_override] = true
        generic_controller.check_maintenance_mode
        generic_controller.cookies[:maintenance_mode_override].should be_present
      end 
    end
  end
  
end