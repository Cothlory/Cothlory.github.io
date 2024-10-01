# This module is licensed under MIT License, (c) 2023 Ulysses Zhan
module Jekyll::UlyssesZhan
end

module Jekyll
	# This module is licensed under MIT License, (c) 2023 Ulysses Zhan
	# Fuck time zones. I hope in one day the world will use UTC everywhere.
	# See: https://github.com/jekyll/jekyll/issues/6033
	module UlyssesZhan::FixTimezone
		Utils.prepend self

		def parse_date input, msg = "Input could not be parsed."
			Time.parse input
		rescue ArgumentError
			raise Errors::InvalidDateError, "Invalid date '#{input}': #{msg}"
		end
	end
end
