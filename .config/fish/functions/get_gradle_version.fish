function get_gradle_version
    set url_line (grep distributionUrl (git rev-parse --show-toplevel)/gradle/wrapper/gradle-wrapper.properties)
    set gradle_version (echo $url_line | grep -P -o '\d+')
    echo $gradle_version | tr ' ' .
end
