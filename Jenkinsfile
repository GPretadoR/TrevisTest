node {
    stage('Checkout/Build/Test') {
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'github',
                url: 'https://github.com/GPretadoR/TrevisTest.git'
            ]]
        ])
    }
    stage('Build') {
        // Build 
        sh 'xcodebuild -scheme "TrevisTest" -configuration "Debug" build'
    }
    stage('Test') {
        // Test
        sh 'xcodebuild -scheme "TrevisTest" -configuration "Debug" test -destination "platform=iOS Simulator,name=iPhone 8,OS=11.2"'
        // Publish test restults.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
    }
}