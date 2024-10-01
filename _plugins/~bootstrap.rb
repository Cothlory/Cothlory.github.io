require 'fileutils'
require 'yaml'
require 'tomlib'
# This module is licensed under MIT License, (c) 2023 Ulysses Zhan
module Jekyll::UlyssesZhan
end

module Jekyll
	# This module is licensed under MIT License, (c) 2023 Ulysses Zhan
	module UlyssesZhan::Bootstrap

		BOOTSTRAP_DIR = 'bootstrap'

		module_function

		def run
			FileUtils.mkdir_p BOOTSTRAP_DIR
			read_env
			read_commit
			read_github_run_id
		end

		def register
			Hooks.register :site, :after_init do |site|
				@site = site
				run
			end
		end

		def read_env
			@site.config['avoid_markdown'] = !!ENV['JEKYLL_AVOID_MARKDOWN']
			@site.config['no_archive'] = !!ENV['JEKYLL_NO_ARCHIVE']
		end

		def read_commit
			@site.config['commit_hash'] = `git rev-parse HEAD`.chomp
			@site.config['commit_time'] = Time.at `git show -s --format=%ct`.to_i
		end

		def read_github_run_id
			@site.config['github_run_id'] = ENV['GITHUB_RUN_ID']
		end
	end

end

Jekyll::UlyssesZhan::Bootstrap.register
