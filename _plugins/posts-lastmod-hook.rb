#!/usr/bin/env ruby

# Add the date of the latest commit that changed a post.
Jekyll::Hooks.register :posts, :post_init do |post|
  commit_num = `git rev-list --count HEAD "#{post.path}"`

  next unless commit_num.to_i > 1

  post.data["last_modified_at"] = `git log -1 --pretty="%ad" --date=iso "#{post.path}"`
end
