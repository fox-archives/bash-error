# shellcheck shell=bash

if [ -z "$BASALT_PACKAGE_DIR" ]; then
	printf "%s\n" "Fatal: source_package.sh: $BASALT_PACKAGE_DIR is empty, but must exist"
	exit 1
fi

if [ -z "$BASALT_GLOBAL_DATA_DIR" ]; then
	printf "%s\n" "Fatal: source_package.sh: $BASALT_GLOBAL_DATA_DIR is empty, but must exist"
	exit 1
fi

# Silently skip if directory doesn't exist since a corresponding warning will print during package installation
# TODO: only do the above for downloaded packages, but when sourcing current package a warning should show
if [ -d "$BASALT_PACKAGE_DIR/pkg/lib/public" ]; then
	# Works if nullglob is unset, given that there is no file called '*'
	for __basalt_f in "$BASALT_PACKAGE_DIR/pkg/lib/public"/*; do
		if [ -f "$__basalt_f" ]; then
			# shellcheck disable=SC1090
			source "$__basalt_f"
		fi
	done; unset __basalt_f
fi

