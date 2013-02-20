ActionController::Base.send :include, InPlaceEditing
ActionController::Base.send :include, InPlaceModelEditing

ActionController::Base.helper InPlaceMacrosHelper
ActionController::Base.helper InPlaceModelHelper
