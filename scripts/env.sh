root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
. "$root/upstream.txt"
if [ -x "$root/tools/jdk/bin/java" ]; then
    export JAVA_HOME="$root/tools/jdk"
    export PATH="$JAVA_HOME/bin:$PATH"
fi
