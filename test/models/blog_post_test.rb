require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for darft blog post" do
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end

  test "published? returns true for published blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? returns false for draft blog post" do
  refute draft_blog_post.scheduled?
  end

  test "published? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert BlogPost.new(published_at: 1.year.from_now).scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    refute draft_blog_post.scheduled?
  end

  test "scheduled? returns false for published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end

end
