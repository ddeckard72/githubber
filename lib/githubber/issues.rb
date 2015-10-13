
module Githubber
	class Issues
		include HTTParty
		base_uri "https://api.github.com"

		def initialize(auth_token)
			@auth = {
				"Authorization" => "token #{auth_token}",
				"User_Agent" => "HTTParty"
			}
		end

		def comment(owner, repo, issue_num, comment)
			Issues.post("repos/#{owner}/#{repo}/issues/#{issue_num}", :headers => @auth, :body => { "body" => comment }.to_json)
		end

		def list_issues(owner, repo)
			Issues.get("repos/#{owner}/#{repo}/issues", :headers => @auth)
		end

		def close_issue(owner, repo, issue_num)
			Issues.patch("repos/#{owner}/#{repo}/issues/#{issue_num}", :headers => @auth, :body => {"state" => "closed"}.to_json)
		end
	end
end

