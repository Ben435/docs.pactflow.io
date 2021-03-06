#!/usr/bin/env ruby

require 'octokit'
require 'base64'
require 'fileutils'
require 'pathname'
require_relative 'support'

SOURCE_REPO = 'pactflow/example-consumer'
DESTINATION_DIR = relative_path_to('website/docs/docs/examples/js/consumer/')
TRANSFORM_PATH = -> (path) { File.join(DESTINATION_DIR, path.downcase) }
INCLUDE = [
  ->(path) { %w{README.md}.include?(path) }
]
IGNORE = []

CUSTOM_ACTIONS = [
  [:all, ->(md_file_contents) {
    md_file_contents.enable_headers
    md_file_contents.extract_title
    md_file_contents.fields[:sidebar_label] = md_file_contents.fields[:title]
    md_file_contents.add_lines_at_start("## Source Code\n\nhttps://github.com/#{SOURCE_REPO}\n")
  }
]
]

FileUtils.mkdir_p DESTINATION_DIR
sync(SOURCE_REPO, INCLUDE, IGNORE, TRANSFORM_PATH, CUSTOM_ACTIONS)

# Duplicate for bi-directional
DESTINATION_DIR2 = relative_path_to('website/docs/docs/examples/bi-directional/consumer/recordreplay')
TRANSFORM_PATH2 = -> (path) { File.join(DESTINATION_DIR2, "readme.md") }
INCLUDE2 = [
  ->(path) { %w{README-bi-directional.md}.include?(path) }
]
FileUtils.mkdir_p DESTINATION_DIR2
sync(SOURCE_REPO, INCLUDE2, IGNORE, TRANSFORM_PATH2, CUSTOM_ACTIONS)
