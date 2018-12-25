process.stdin.on('data' , (d) => {

    const lines = d.toString('utf8').split('\n')

    const testResults = []

    let testSuites = {}

    /// search for test suites
    lines.forEach(line =>   {
        let suite = line.match(/^Test Suite \'([^']+)\'/)
        if(suite === null) return
        if(testSuites[suite[1]] === undefined) {
            testSuites[suite[1]] = {
                name: suite[1],
                cases: {}
            }
        }
    })

    /// search for test suites
    lines.forEach(line =>   {
        let testCase = line.match(/^Test Case \'([^']+)\.([^']+)\' (.*)/)
        if(testCase === null) return

        let suite = testSuites[testCase[1]]
        if(suite.cases[testCase[2]] === undefined) {
            suite.cases[testCase[2]] = {
                name: testCase[2],
                passed: null,
                started: null,
                failed: null
            }
        }

        const started = testCase[3].match(/^started at (.*)/)
        const passed = testCase[3].match(/^passed \((\d+\.\d+ seconds)\)/)
        const failed = testCase[3].match(/^failed \((\d+\.\d+ seconds)\)/)
       
        suite.cases[testCase[2]].passed = passed === null ? null : passed[1]
        suite.cases[testCase[2]].failed = failed === null ? null : failed[1]
        suite.cases[testCase[2]].started = started === null ? null : started[1]

    })

    let suites = Object.keys(testSuites).map( key => { 
        let suite = testSuites[key] 
        suite.cases = Object.keys(suite.cases).map( key => { return suite.cases[key] } )
        suite.executed = suite.cases.length
        suite.passed = suite.cases.filter(c => { if(c.passed !== null) return c }).length
        suite.failed = suite.cases.filter(c => { if(c.failed !== null) return c }).length
        return suite
    })

suites.forEach((suite) => {
let s = ` 
        Suite: ${suite.name}
`
suite.cases.forEach(c => {
let result = c.passed === null ? 'failed ' : 'passed'
s += `
            Case ${result.toUpperCase()}: ${c.name}
`
})
console.log(s)
})
    
})