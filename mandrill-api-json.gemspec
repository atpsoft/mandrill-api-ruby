Gem::Specification.new do |s|
    s.name = 'mandrill-api-json'
    s.version = '1.0.57'
    s.summary = 'A Ruby API library for the Mandrill email as a service platform, forked to support json 2.0.2.  Originally on https://bitbucket.org/mailchimp/mandrill-api-ruby/'
    s.description = s.summary
    s.authors = ['Mandrill Devs']
    s.email = 'community@mandrill.com'
    s.files = ['lib/mandrill.rb', 'lib/mandrill/api.rb', 'lib/mandrill/errors.rb']
    s.homepage = 'https://github.com/atpsoft/mandrill-api-ruby'
    s.add_dependency 'json', '>= 1.8'
    s.add_dependency 'excon', '>= 0.16.0', '< 1.0'
end
