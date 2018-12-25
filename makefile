default: 
	nodemon --exec "swift build;./.build/debug/SwiftTypescript" -e "swift"

test: 
	nodemon --exec "swift test > test.result.log" -e "swift" > /dev/null

testlog: 
	nodemon --exec "cat test.result.log | node testParse.js" -e "log"
