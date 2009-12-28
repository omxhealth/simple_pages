# Simple Pages

A dummy plugin did for easy static page maintenance.


## Example

Include the SimplePages into a PagesController:

  class PagesController
    include SimplePages
  end

Then add into your routes the PagesController route:

  ActionController::Routing::Routes.draw do |map|
    ...
    map.resources :pages
    ...
  end

Now create the folder pages into your views folder and put there the templates you wish to render out. Remember to add a show.html.erb as the default template:

  + app
  |- views
     |- pages
        |- show.html.erb
        |- about_us.html.erb

So you can access the views getting:

  `http://localhost:3000/pages/about-us`

## Improving

Let's say you want to put the PagesController as a default route and get this behavior:

  `http://localhost:3000/about-us`

You can get it changing the routes to:

  `
  ActionController::Routing::Routes.draw do |map|
    ...
    map.connect ':id', :controller => 'show', :action => 'show'
  end
  `


Copyright (c) 2009 [Bruno Azisaka Maciel], released under the MIT license