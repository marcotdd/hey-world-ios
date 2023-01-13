// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SchemaGraphQL_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SchemaGraphQL.SchemaMetadata {}

public protocol SchemaGraphQL_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SchemaGraphQL.SchemaMetadata {}

public protocol SchemaGraphQL_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SchemaGraphQL.SchemaMetadata {}

public protocol SchemaGraphQL_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SchemaGraphQL.SchemaMetadata {}

public extension SchemaGraphQL {
  typealias ID = String

  typealias SelectionSet = SchemaGraphQL_SelectionSet

  typealias InlineFragment = SchemaGraphQL_InlineFragment

  typealias MutableSelectionSet = SchemaGraphQL_MutableSelectionSet

  typealias MutableInlineFragment = SchemaGraphQL_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return SchemaGraphQL.Objects.Query
      case "Country": return SchemaGraphQL.Objects.Country
      case "Continent": return SchemaGraphQL.Objects.Continent
      case "Language": return SchemaGraphQL.Objects.Language
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}