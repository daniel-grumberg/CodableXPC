# CodableXPC

[![Build Status](https://travis-ci.com/daniel-grumberg/CodableXPC.svg?branch=master)](https://travis-ci.com/daniel-grumberg/CodableXPC)

This provides an Encoder and Decoder protocol implementation that should allow
users to target libxpc. This is only available on macOS as libxpc is not
supported on other platforms.

## Usage

The usage is very simple, your types should conform to `Codable`, `Decodable`,
or `Encodable` depending the semantics you want. Then you should use the
provided `XPCEncoder.encode` and `XPCDecoder.decode` static functions to
marshal and unmarshal from and to native `xpc_object_t` respectively. A short
minimal example is provided below.

```swift
struct TestStruct {
    let opinion = "XPC is awesome!"
}

let value = TestStruct()
let payload = try! XPCEncoder.encode(value)
let decoded = try! XPCDecoder.decode(payload)

assert(value == decoded)
```

However, it is worth noting that this API is not sufficient to write correct XPC
code in Swift. You will need to provide a correct `xpc_main` and manage your
transactions using the existing abstractions provided by the SDK. Specifically,
this API does not support reply dictionaries.

Again, this library is only meant to be used as a way to reduce boilerplate
around writing marshalling code for Swift types and cannot be used without the
usual libxpc APIs provided by the macOS SDK.

## Dependencies and Distribution

This package is distributed solely using SwiftPM. As far as I know this has no
dependencies apart from the standard macOS SDK, but if you find something let me
know.
