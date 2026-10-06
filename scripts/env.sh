root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
. "$root/upstream.txt"
work="$root/work-$mc"
if [ -x "$root/tools/jdk$java/bin/java" ]; then
    export JAVA_HOME="$root/tools/jdk$java"
elif [ -x "$root/tools/jdk/bin/java" ]; then
    export JAVA_HOME="$root/tools/jdk"
fi
[ -n "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"
