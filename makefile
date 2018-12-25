default: 
	nodemon --exec "swift build;./.build/debug/SwiftTypescript" -e "swift"

test: 
	nodemon --exec "swift test" -e "swift"
