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

    http://localhost:3000/pages/about-us

## Improving

Let's say you want to put the PagesController as a default route and get this behavior:

    http://localhost:3000/about-us

You can get it changing the routes to:

    ActionController::Routing::Routes.draw do |map|
      ...
      map.connect ':id', :controller => 'show', :action => 'show'
    end
    
## Acknowledgment

fnando's has_permalink plugin where I got the [permalink method](http://github.com/fnando/has_permalink/blob/master/lib/permalink/string_ext.rb).

Copyright (c) 2009 [Bruno Azisaka Maciel], released under the MIT license

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.