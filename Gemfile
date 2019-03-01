source 'https://rubygems.org'
ruby "2.3.1"

gem 'rails', '~> 4.2.11'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'fancybox2-rails'
# gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'mime-types'
gem 'geo_coord'

gem 'cloudinary'


gem 'refinerycms-blog', git: 'https://github.com/refinery/refinerycms-blog', branch: 'master'
gem 'refinerycms-page-images', '~> 3.0.0'
gem 'refinerycms-inquiries', '~> 3.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'

  gem "better_errors"
  gem "binding_of_caller"
end

gem 'dotenv-rails', :groups => [:development, :test]


# Refinery CMS
gem 'refinerycms', '~> 3.0'

# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', ['~> 2.0', '>= 2.0.1']
gem 'rhythm-refinerycms-wymeditor', :git => 'git://github.com/johnlucia/rhythm-refinerycms-wymeditor.git'
gem 'refinerycms-authentication-devise', '~> 1.0'
#  gem 'refinerycms-blog', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-inquiries', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-search', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-page-images', ['~> 3.0', '>= 3.0.0']

group :production do
  gem 'dragonfly-s3_data_store'
  gem 'rails_12factor'
  gem 'puma'
  gem 'newrelic_rpm'
  gem 'puma_worker_killer'
end
