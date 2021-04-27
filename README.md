# SimpleRubyApiSinatra
Used for testing 


Requires Ruby installed tested on 2.7  << will refer to https://www.ruby-lang.org/en/ for setup as its diffrent on every os and machine

will required sinatra and json gem to be installed there is a gemfile to run if your using bundle failing that

gem install json  << please note this is probably not required as i think all version of ruby since 1.something include json
gem install sinatra



once install simply run 
```
ruby SimpleApi.rb 
```
from same directory as the simpleapi.rb 


webricks server should automatically start and tell you the port its running on default is 4567


then simply run 
```
ngrok http **** 
```
with * being replaced for the port full docs and download avalible here https://ngrok.com/

which will give you a public https tunnel
