// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension SchemaGraphQL {
  class GetCountryDetailQuery: GraphQLQuery {
    public static let operationName: String = "GetCountryDetail"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetCountryDetail($code: ID!) {
          country(code: $code) {
            __typename
            code
            name
            native
            phone
            continent {
              __typename
              code
              name
            }
            capital
            currency
            languages {
              __typename
              code
              name
              native
            }
            emoji
          }
        }
        """#
      ))

    public var code: ID

    public init(code: ID) {
      self.code = code
    }

    public var __variables: Variables? { ["code": code] }

    public struct Data: SchemaGraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("country", Country?.self, arguments: ["code": .variable("code")]),
      ] }

      public var country: Country? { __data["country"] }

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
          .field("native", String.self),
          .field("phone", String.self),
          .field("continent", Continent.self),
          .field("capital", String?.self),
          .field("currency", String?.self),
          .field("languages", [Language].self),
          .field("emoji", String.self),
        ] }

        public var code: SchemaGraphQL.ID { __data["code"] }
        public var name: String { __data["name"] }
        public var native: String { __data["native"] }
        public var phone: String { __data["phone"] }
        public var continent: Continent { __data["continent"] }
        public var capital: String? { __data["capital"] }
        public var currency: String? { __data["currency"] }
        public var languages: [Language] { __data["languages"] }
        public var emoji: String { __data["emoji"] }

        /// Country.Continent
        ///
        /// Parent Type: `Continent`
        public struct Continent: SchemaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Continent }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("code", SchemaGraphQL.ID.self),
            .field("name", String.self),
          ] }

          public var code: SchemaGraphQL.ID { __data["code"] }
          public var name: String { __data["name"] }
        }

        /// Country.Language
        ///
        /// Parent Type: `Language`
        public struct Language: SchemaGraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Language }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("code", SchemaGraphQL.ID.self),
            .field("name", String?.self),
            .field("native", String?.self),
          ] }

          public var code: SchemaGraphQL.ID { __data["code"] }
          public var name: String? { __data["name"] }
          public var native: String? { __data["native"] }
        }
      }
    }
  }

}