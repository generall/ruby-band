require 'java'
require 'lock_jar'

# get jarfile relative to the gem dir
lockfile = File.expand_path('../../Jarfile.lock', __FILE__)

# load the ClassPath with Jars from the lockfile
LockJar.load(lockfile, local_repo: File.expand_path("../../jars", __FILE__))

require 'ruby-band/core'
require 'ruby-band/weka'
require 'ruby-band/apache'

Random.ancestors[1].instance_eval {remove_const :Random} if defined?(Random)
java_import 'java.util.Random'

