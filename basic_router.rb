require_relative '../framework'

class Router

  def initialize(routes)
    @routes = routes
  end

  def route?(request_info)
    !!dispatch(request_info)
  end

  def dispatch(request_info)
    @routes.each do |route,action|
      return action if route_match(route, request_info)
    end
    false
  end

  def segments
    Hash[ @match.names.map{|n|n.to_sym}.zip( @match.captures )]
  end

  def route_match(route, request)
    @match = Regexp.new("^" + route.gsub(/:(?<foo>[a-z0-9-]+)/, '(?<\k<foo>>[a-z0-9-]+)') + "$").match(request)
  end
end

ROUTES = {
  "GET /home" => ["HomeController", :index],
  "GET /posts/:slug/comments/:id/edit" => ["CommentsController", :edit],
}

router = Router.new ROUTES


Test.expect router.route?("GET /home")
Test.expect router.route?("GET /posts/test-post/comments/12/edit")
Test.expect !router.route?("GET /nope")

Test.expect router.dispatch("GET /home") == ["HomeController", :index]
Test.expect router.dispatch("GET /posts/test-post/comments/12/edit") == ["CommentsController", :edit]
Test.expect router.segments == { slug: "test-post", id: "12" }