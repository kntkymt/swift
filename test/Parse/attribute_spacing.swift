// RUN: %target-typecheck-verify-swift -swift-version 5 -verify-additional-prefix swift5-
// RUN: %target-typecheck-verify-swift -swift-version 6 -verify-additional-prefix swift6-

// expected-swift5-warning@+2 {{extraneous whitespace between '@' and attribute name; this is an error in the Swift 6 language mode}}
// expected-swift6-error@+1 {{extraneous whitespace between '@' and attribute name}}
@ MainActor  
class Foo {
  // expected-swift5-warning@+2 {{extraneous whitespace between '@' and attribute name; this is an error in the Swift 6 language mode}}
  // expected-swift6-error@+1 {{extraneous whitespace between '@' and attribute name}}
  func funcWithEscapingClosure(_ x: @ escaping () -> Int) {}
}

// expected-swift5-warning@+2 {{extraneous whitespace between attribute name and '('; this is an error in the Swift 6 language mode}}
// expected-swift6-error@+1 {{extraneous whitespace between attribute name and '('}}
@available (*, deprecated)
func deprecated() {}

@propertyWrapper
struct MyPropertyWrapper {
  var wrappedValue: Int = 1

  init(param: Int) {}
}

struct PropertyWrapperTest {
  // expected-swift5-warning@+4 {{extraneous whitespace between attribute name and '('; this is an error in the Swift 6 language mode}}
  // expected-swift6-error@+3 {{expected 'var' keyword in property declaration}}
  // expected-swift6-error@+2 {{property declaration does not bind any variables}}
  // expected-swift6-error@+1 {{expected pattern}}
  @MyPropertyWrapper (param: 2)
  var x: Int
}

// expected-swift5-warning@+1 {{extraneous whitespace between attribute name and '('; this is an error in the Swift 6 language mode}}
let closure1 = { @MainActor (a: Int, b: Int) in
}

let closure2 = { @MainActor
  (a: Int, b: Int) in
}

// expected-swift5-warning@+2{{extraneous whitespace between '@' and attribute name; this is an error in the Swift 6 language mode}}
// expected-swift6-error@+1{{extraneous whitespace between '@' and attribute name}}
@ 
MainActor
func mainActorFunc() {}
