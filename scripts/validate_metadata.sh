#!/usr/bin/env bash
##
# Validate Elastic APM Metadata schema against data file
#
# @author Gordon Hackett https://github.com/linuxwebexpert
# @date 2019-07-12
# @see https://www.elastic.co/guide/en/apm/server/7.0/metadata-api.html
# @see https://www.npmjs.com/package/ajv-cli
# @see https://json-schema.org/specification.html
##

usage() {
    cat <<EOM
    Usage:
    $(basename $0) filename

    Validates a given filename against the Elastic 7.0 APM Metadata JSON schema using ajv-cli

EOM
    exit 0
}

[ -z $1 ] && { usage; }

ajv validate --missing-refs=ignore --extend-refs=true -s doc/spec/metadata.json -r doc/spec/service.json -r doc/spec/system.json -r doc/spec/process.json -r doc/spec/user.json -r doc/spec/tags.json -d $1

