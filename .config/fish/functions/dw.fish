function dw
    set gradle_version (get_gradle_version)
    d wrapper --gradle-distribution-url=https://esw-artifactory.got.volvo.net/artifactory/gradle-distributions/gradle-$gradle_version-bin.zip
end
