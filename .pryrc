$: << 'lib'
require 'yello/import'
include Yello::Trello

Trello.configure do |c|
  c.developer_public_key = auth.key
  c.member_token = auth.token
end
