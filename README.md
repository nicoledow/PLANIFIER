# Planifier
Planifier (French for *to plan*) is a web application that lets teachers post their lesson plans for colleagues or students to see. Teachers, students, or administration can use the site to browse lesson plans by course or by teachers. All content is user-generated, but protected by mandatory login. 

# Why Planifier?
During my teaching career, sharing resources and plans with my colleagues kept me both sane and inspired. Sharing among colleagues fosters school community and leads to greater creativity when it comes to lesson planning. I hope this application will help teachers help each other!

# Installation
This repository can be forked and run locally. 

Ensure you have the "Bundler" gem installed, and run "bundle install" to install all gem dependencies. 

Run the "rake db:migrate" command from the terminal to generate database tables.

Run the "shotgun" command from the terminal to run the application on local port 9393.

# Frameworks and Technologies
Planifier is a Sinatra web application written with Ruby, ERB, HTML, and CSS. Data is managed and manipulated by using ActiveRecord and SQLite3.

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/nicoledow/city_skies. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.


# License
Copyright 2019 Nicole Dow

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
