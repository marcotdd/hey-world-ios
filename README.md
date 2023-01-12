# Hey World - iOS Application
A SwiftUI MVVM sample code. The goal of Hey World is to present informations for each country of the world. 🌍

## Requirements

- Xcode 14 (with Swift 5.7)
- iOS 15 SDK
- iOS 15 deployment target

## GraphQL

### Fetch
This is used to fetch the GraphQL schema
```console
./apollo-ios-cli fetch-schema --path ./HeyWorld/GraphQL/apollo-codegen-config.json
```

### Generate
This is used to generate Swift source code
```console
./apollo-ios-cli generate --path ./HeyWorld/GraphQL/apollo-codegen-config.json
```

## Third Party Software
- [Apollo iOS 1.0.6](https://github.com/apollographql/apollo-ios)
