

## Gulp base 

> while this is a base image it can be used directly

```shell
docker build -t cjlyth/gulp-base .
```

## Default implementation 

> using this image will add local files and install gulp to the container local `/gulp-app`

```shell
docker build -t cjlyth/gulp:latest - <<-"EOF"
	FROM cjlyth/gulp-base
EOF
```

### Using the default implementation

```shell
docker run -it --rm cjlyth/gulp
```	

```shell
docker run -it --entrypoint="/usr/bin/env" --rm cjlyth/gulp bash
```


```
alias gulp='docker run -it --rm -v $(pwd):/gulp-app --entrypoint="/usr/bin/env" cjlyth/gulp bash'
```

```

docker build -t "cjlyth/gulp:shell" - <<-"EOF"
	FROM cjlyth/gulp-base
	ENTRYPOINT ["/usr/bin/env"]
	CMD ["bash"]
EOF

```


## Build tools

try this sed snippet to pull code blocks out of this readme _**remember to put the shell**_

```sed
sed -nf - <<-"EOF" README.md
	/^```shell/,/^```/ {
		/^```/ d
		/^[[:blank:]]*\(#.*\)*$/ d
		p
	}
EOF
```

I create a script then source it in like so: `. <(./build-md-containers.sh)`