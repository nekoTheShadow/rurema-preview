require 'logger'

@log = Logger.new(STDOUT)

def run(cmd)
  @log.info("START `#{cmd}`")

  unless system(cmd)
    @log.fatal("FAIL `#{cmd}`")
    exit(1)
  end

  @log.info("SUCCESS `#{cmd}`")
end

version = ENV["TARGET_VERSION"] || ENV["RUBY_VERSION"]
run("bitclust -d /db init version=#{version} encoding=UTF-8")
run("bitclust -d /db update --stdlibtree=/src/refm/api/src")
run('bitclust server --database=/db --debug --baseurl=""')