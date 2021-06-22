Rails.application.routes.draw do
  mount LocalResource::Engine => "/local_resource"
end
