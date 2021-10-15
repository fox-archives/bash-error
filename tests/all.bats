#!/usr/bin/env bats

load './util/init.sh'

@test "err.exists works when set" {
	# Function sets error when it fails
	err.set 1 "Failed to eat grass"

	# Callsite notices failure, and checks error
	err.exists
}

@test "err.exists works when not set 1" {
	! err.exists
}

@test "err.exists works when not set 2" {
	err.clear

	! err.exists
}

@test "err.set sets variables correctly" {
	err.set 2 "value_woof"

	[ "$ERRCODE" = 2 ]
	[ "$ERR" = 'value_woof' ]
}
