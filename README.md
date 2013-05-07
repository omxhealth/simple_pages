# Simple Pages

This gem aims to make it easy to have "static" pages in a Rails
application.

## Example

Include the SimplePages into a PagesController:

    class PagesController < ApplicationController
      include SimplePages
    end

Then add the PagesController route into your routes:

    Dummy::Application.routes.draw do
      ...
      resources :pages
      ...
    end

Now create the pages folder into your views folder and put there the
templates you want to render. **Remember to add a show.html.erb as the
default template**:

    + app
    |- views
       |- pages
          |- show.html.erb
          |- about_us.html.erb

So you can access the views as:

    http://localhost:3000/pages/about-us

## Improving

Let's say you want to put the PagesController as a default route and get this behavior:

    http://localhost:3000/about-us

You can get it changing the routes to:

    Dummy::Application.routes.draw do
      ...
      match '*id' => 'pages#show'
    end
    
## License

Copyright (c) 2013 [Bruno Azisaka Maciel], released under the MIT license

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
