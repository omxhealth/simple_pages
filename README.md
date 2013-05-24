# Simple Pages

[![Build Status](https://travis-ci.org/azisaka/simple_pages.png?branch=master)](https://travis-ci.org/azisaka/simple_pages)

Every time I create a project that needs "static" pages, I have to
create a controller to handle the views. Sometimes it requires
translations, some processing, and it takes some time effort to do it. 

Althought it's just a simple controller, you need to handle special
characters like "-" or missing templates with a 404. 

Time gem was created make it simpler.

## Example

To have it working in a standard way, just install the gem:

    gem 'simple_pages'

Then ``bundle install`` it. 

After that, you can mount the engine as:

    Dummy::Application.routes.draw do
      ...
      
      mount SimplePages::Engine => "/"
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

    http://localhost:3000/about-us

## 404

You can create a custom 404 action, just create a view named
not_found.html.erb

## Custom Controller and Actions

It's possible to use a custom controller, just create it

    class CustomPagesController < SimplePages::PagesController
      def add_your_action
        # to do something
      end
    end

And change the routes.rb to

    
    Dummy::Application.routes.draw do
      ...
      
      match "*id" => "custom_pages#show"
    end

Then you can access as

    http://localhost:3000/add-your-action

You can create a view named add_your_action.html.erb or just let it
render the show.html.erb view.

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
