#!/usr/bin/env bash
sed -nf - <<-"EOF" README.md
	/^```shell/,/^```/ {
		/^```/ d
		/^[[:blank:]]*\(#.*\)*$/ d
		p
	}
EOF