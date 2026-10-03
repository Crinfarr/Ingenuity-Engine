The Ingenuity Engine backend uses the following formats:

- NAT, the socket, and all data transfer is handled using [Iroh](https://iroh.computer) by n0.computer, licensed under MIT
  - Iroh provides libraries and/or bindings for the following languages:
    - [Rust](https://docs.iroh.computer/languages/rust)
    - [Python](https://docs.iroh.computer/languages/python)
    - [Swift](https://docs.iroh.computer/languages/swift)
    - [Kotlin](https://docs.iroh.computer/languages/kotlin)
    - [JavaScript + TypeScript](https://docs.iroh.computer/languages/javascript)
    - [C/C++](https://docs.iroh.computer/languages/c)
    - [Go](https://docs.iroh.computer/languages/go)
    - Additional "community" (read: unsupported) FFI bindings are available as well. 
- All messages are serialized using [MessagePack](https://msgpack.org)
  - MessagePack supports [virtually all programming languages](https://msgpack.org "As of writing the official page lists ActionScript 3, Arduino, Arduino C, C, C#, C++11, C++17, Clojure, Crystal, D, Dart, Delphi, Elixir, Erlang, F#, Go, HHVM, Haskell, Haxe, Jackson-dataformat, Java, Javascript, Typescript, Kotlin, Lua, Matlab, Nim, Node, OCaml, ObjectiveC, PHP, Pascal, Perl, Pony, Postgres, Python, QT, R, Rails, Retrofit/Java, Ruby, Rust, SION, Scala, Scala.js, Shell, Smalltalk, Swift, and UNIX Shell"), and provides [an open spec](https://github.com/msgpack/msgpack/blob/master/spec.md) in case you don't use *any* of the ones I listed in the alt text of that link
- Cards for Ingenuity Engine are written in Lua
  - Stub definitions and docs will be available here once they're stabilized
