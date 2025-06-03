# Mailchimp official gem
As of 2020, Mailchimp has an official gem for this: https://rubygems.org/gems/MailchimpTransactional

As of June 2023, this mandrill-api gem is working (and we are still using it), but I don't know how long that will stay true.

On June 3, 2025, in an attempt to resolve a warning github was showing, I accidentally wiped the history by clicking on "discard 8 commits".  I had a local backup, so I cherry-picked them, but the timestamps of the commits are no longer valid.  The first 3 were 2017, the next 2 2020, the next 2 2023, and the last 1 2025

# mandrill-api-ruby


`mandrill-api-ruby` is a fork of [mandrill-api gem](https://www.ruby-toolbox.com/projects/mandrill-api) ([src](https://bitbucket.org/mailchimp/mandrill-api-ruby/src/master/)) with uptodate dependencies.

Original code here: https://bitbucket.org/mailchimp/mandrill-api-ruby/

Thanks to https://github.com/stellaservice/mandrill-api-ruby for fixing the json dependency.

### Usage

in your  Gemfile change

```
gem 'mandrill-api'
```

to

```
gem 'mandrill-api-json'
```

and run `bundle install`

### How to check attachments in Test Mode on Mandrill

In order to retrieve Mandrill attachments in test mode the following script can be used:

```ruby
require 'mandrill'
require 'base64'

def extract_attachments(email)
  attachments = []

  email['attachments'].each do |attachment|
    attachment_data = attachment['content']
    file_name = attachment['name']
    content_type = attachment['type']

    # Decode the attachment data from base64
    decoded_data = Base64.decode64(attachment_data)

    # Save the attachment to a file
    File.open(file_name, 'wb') do |file|
      file.write(decoded_data)
    end

    attachments << {
      file_name: file_name,
      content_type: content_type
    }
  end

  attachments
end

# Mandrill API key
mandrill_api_key = 'YOUR_MANDRILL_API_KEY'

# Mandrill message ID of the delivered email.
# You can find it in https://mandrillapp.com/settings/api, within the request of the email sent.
message_id = 'YOUR_DELIVERED_EMAIL_MESSAGE_ID'

# Initialize Mandrill client
mandrill = Mandrill::API.new(mandrill_api_key)

# Retrieve the message content using Mandrill API
message_info = mandrill.messages.content(message_id)

# Extract attachments from the message
attachments = extract_attachments(message_info)

# Print the extracted attachments
attachments.each do |attachment|
  puts "Attachment: #{attachment[:file_name]}"
  puts "Content Type: #{attachment[:content_type]}"
  puts "---"
end

```
