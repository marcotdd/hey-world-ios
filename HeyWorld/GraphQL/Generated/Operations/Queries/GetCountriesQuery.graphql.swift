// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension SchemaGraphQL {
  class GetCountriesQuery: GraphQLQuery {
    public static let operationName: String = "GetCountries"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetCountries {
          countries {
            __typename
            code
            name
            emoji
          }
        }
        """#
      ))

    public init() {}

    public struct Data: SchemaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country].self),
      ] }

      public var countries: [Country] { __data["countries"] }

      /// Country
      ///
      /// Parent Type: `Country`
      public struct Country: SchemaGraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Country }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("code", SchemaGraphQL.ID.self),
          .field("name", String.self),
          .field("emoji", String.self),
        ] }

        public var code: SchemaGraphQL.ID { __data["code"] }
        public var name: String { __data["name"] }
        public var emoji: String { __data["emoji"] }
      }
    }
  }

}