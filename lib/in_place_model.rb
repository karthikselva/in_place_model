module InPlaceModel
  def self.included(base)
    base.extend(ClassMethods)
  end 

  # Example:
  #
  #   # Controller
  #   class BlogController < ApplicationController
  #     in_place_model_for :post
  #   end
  #
  #   # View
  #   <%= in_place_model :post , 1 , :exclude => [:created_at]  , :read_only => [:id] %>
  #   <%= in_place_model_all :post  , :exclude => [:created_at] , :read_only => [:id] %>
  #
  module ClassMethods
    def in_place_edit_for(object, attribute, options = {})
      define_method("set_#{object}_#{attribute}") do
        unless [:post, :put].include?(request.method) then
          return render(:text => 'Method not allowed', :status => 405)
        end
        @item = object.to_s.camelize.constantize.find(params[:id])
        @item.update_attribute(attribute, params[:value])
        render :text => CGI::escapeHTML(@item.send(attribute).to_s)
      end
    end

    def in_place_model_for(object)
      model = object.to_s.camelize.constantize
      @columns = model.columns.collect{|e| e.name}
      @columns.each do |column|
        in_place_edit_for(object,column)
      end

      define_method("paginate_#{object}") do
        redirect_to "/#{object}" , :page => params[:page]
      end
    end
  end

end
