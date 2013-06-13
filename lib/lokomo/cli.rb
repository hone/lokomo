require 'lokomo'
require 'thor'
require 'tmpdir'
require 'fileutils'

module Lokomo
  class CLI < Thor
    desc "compile REPO_DIR", "runs bin/compile from the buildpack"
    def compile(repo_dir)
      buildpack_dir = "."

      build_dir = Dir.mktmpdir("build-")
      puts "build dir: #{build_dir}"
      Dir.mktmpdir("cache-") do |cache_dir|
        puts "cache dir: #{cache_dir}"
        FileUtils.rmdir(build_dir)
        FileUtils.cp_r(repo_dir, build_dir)
        pipe("#{buildpack_dir}/bin/compile #{build_dir} #{cache_dir}")
      end
    end

    private
    # run a shell command and stream the output
    # @param [String] command to be run
    def pipe(command)
      output = ""
      IO.popen(command) do |io|
        until io.eof?
          buffer = io.gets
          output << buffer
          puts buffer
        end
      end

      output
    end
  end
end
