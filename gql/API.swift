//  This file was automatically generated and should not be edited.

import Apollo

/// Emojis that can be attached to Issues, Pull Requests and Comments.
public enum ReactionContent: String {
  case thumbsUp = "THUMBS_UP" /// Represents the 👍 emoji.
  case thumbsDown = "THUMBS_DOWN" /// Represents the 👎 emoji.
  case laugh = "LAUGH" /// Represents the 😄 emoji.
  case hooray = "HOORAY" /// Represents the 🎉 emoji.
  case confused = "CONFUSED" /// Represents the 😕 emoji.
  case heart = "HEART" /// Represents the ❤️ emoji.
}

extension ReactionContent: JSONDecodable, JSONEncodable {}

public final class AddReactionMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation AddReaction($subject_id: ID!, $content: ReactionContent!) {" +
    "  addReaction(input: {subjectId: $subject_id, content: $content}) {" +
    "    __typename" +
    "    subject {" +
    "      __typename" +
    "      ...reactionFields" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(ReactionFields.fragmentDefinition)

  public let subjectId: GraphQLID
  public let content: ReactionContent

  public init(subjectId: GraphQLID, content: ReactionContent) {
    self.subjectId = subjectId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["subject_id": subjectId, "content": content]
  }

  public struct Data: GraphQLMappable {
    /// Adds a reaction to a subject.
    public let addReaction: AddReaction?

    public init(reader: GraphQLResultReader) throws {
      addReaction = try reader.optionalValue(for: Field(responseName: "addReaction", arguments: ["input": ["subjectId": reader.variables["subject_id"], "content": reader.variables["content"]]]))
    }

    public struct AddReaction: GraphQLMappable {
      public let __typename: String
      /// The reactable subject.
      public let subject: Subject

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        subject = try reader.value(for: Field(responseName: "subject"))
      }

      public struct Subject: GraphQLMappable {
        public let __typename: String

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))

          let reactionFields = try ReactionFields(reader: reader)
          fragments = Fragments(reactionFields: reactionFields)
        }

        public struct Fragments {
          public let reactionFields: ReactionFields
        }
      }
    }
  }
}

public final class IssueOrPullRequestQuery: GraphQLQuery {
  public static let operationDefinition =
    "query IssueOrPullRequest($owner: String!, $repo: String!, $number: Int!, $page_size: Int!) {" +
    "  repository(owner: $owner, name: $repo) {" +
    "    __typename" +
    "    name" +
    "    issueOrPullRequest(number: $number) {" +
    "      __typename" +
    "      ... on Issue {" +
    "        __typename" +
    "        timeline(first: $page_size) {" +
    "          __typename" +
    "          nodes {" +
    "            __typename" +
    "            ... on Commit {" +
    "              __typename" +
    "              author {" +
    "                __typename" +
    "                name" +
    "                date" +
    "              }" +
    "              messageHeadline" +
    "            }" +
    "            ... on IssueComment {" +
    "              __typename" +
    "              ...nodeFields" +
    "              ...reactionFields" +
    "              ...commentFields" +
    "            }" +
    "            ... on LabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on UnlabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ClosedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ReopenedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on RenamedTitleEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "              currentTitle" +
    "            }" +
    "            ... on LockedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "          }" +
    "        }" +
    "        ...reactionFields" +
    "        ...commentFields" +
    "        ...lockableFields" +
    "        ...closableFields" +
    "        ...labelableFields" +
    "        ...updatableFields" +
    "        ...nodeFields" +
    "        number" +
    "        title" +
    "      }" +
    "      ... on PullRequest {" +
    "        __typename" +
    "        timeline(first: $page_size) {" +
    "          __typename" +
    "          nodes {" +
    "            __typename" +
    "            ... on Commit {" +
    "              __typename" +
    "              author {" +
    "                __typename" +
    "                name" +
    "                date" +
    "              }" +
    "              messageHeadline" +
    "            }" +
    "            ... on IssueComment {" +
    "              __typename" +
    "              ...nodeFields" +
    "              ...reactionFields" +
    "              ...commentFields" +
    "            }" +
    "            ... on LabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on UnlabeledEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              label {" +
    "                __typename" +
    "                color" +
    "                name" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ClosedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on ReopenedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "            ... on RenamedTitleEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "              currentTitle" +
    "            }" +
    "            ... on LockedEvent {" +
    "              __typename" +
    "              ...nodeFields" +
    "              actor {" +
    "                __typename" +
    "                login" +
    "              }" +
    "              createdAt" +
    "            }" +
    "          }" +
    "        }" +
    "        ...reactionFields" +
    "        ...commentFields" +
    "        ...lockableFields" +
    "        ...closableFields" +
    "        ...labelableFields" +
    "        ...updatableFields" +
    "        ...nodeFields" +
    "        number" +
    "        title" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(NodeFields.fragmentDefinition).appending(ReactionFields.fragmentDefinition).appending(CommentFields.fragmentDefinition).appending(LockableFields.fragmentDefinition).appending(ClosableFields.fragmentDefinition).appending(LabelableFields.fragmentDefinition).appending(UpdatableFields.fragmentDefinition)

  public let owner: String
  public let repo: String
  public let number: Int
  public let pageSize: Int

  public init(owner: String, repo: String, number: Int, pageSize: Int) {
    self.owner = owner
    self.repo = repo
    self.number = number
    self.pageSize = pageSize
  }

  public var variables: GraphQLMap? {
    return ["owner": owner, "repo": repo, "number": number, "page_size": pageSize]
  }

  public struct Data: GraphQLMappable {
    /// Lookup a given repository by the owner and repository name.
    public let repository: Repository?

    public init(reader: GraphQLResultReader) throws {
      repository = try reader.optionalValue(for: Field(responseName: "repository", arguments: ["owner": reader.variables["owner"], "name": reader.variables["repo"]]))
    }

    public struct Repository: GraphQLMappable {
      public let __typename: String
      /// The name of the repository.
      public let name: String
      /// Returns a single issue-like object from the current repository by number.
      public let issueOrPullRequest: IssueOrPullRequest?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        name = try reader.value(for: Field(responseName: "name"))
        issueOrPullRequest = try reader.optionalValue(for: Field(responseName: "issueOrPullRequest", arguments: ["number": reader.variables["number"]]))
      }

      public struct IssueOrPullRequest: GraphQLMappable {
        public let __typename: String

        public let asIssue: AsIssue?
        public let asPullRequest: AsPullRequest?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))

          asIssue = try AsIssue(reader: reader, ifTypeMatches: __typename)
          asPullRequest = try AsPullRequest(reader: reader, ifTypeMatches: __typename)
        }

        public struct AsIssue: GraphQLConditionalFragment {
          public static let possibleTypes = ["Issue"]

          public let __typename: String
          /// A list of events associated with an Issue.
          public let timeline: Timeline
          /// Identifies the issue number.
          public let number: Int
          /// Identifies the issue title.
          public let title: String

          public let fragments: Fragments

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            timeline = try reader.value(for: Field(responseName: "timeline", arguments: ["first": reader.variables["page_size"]]))
            number = try reader.value(for: Field(responseName: "number"))
            title = try reader.value(for: Field(responseName: "title"))

            let reactionFields = try ReactionFields(reader: reader)
            let commentFields = try CommentFields(reader: reader)
            let lockableFields = try LockableFields(reader: reader)
            let closableFields = try ClosableFields(reader: reader)
            let labelableFields = try LabelableFields(reader: reader)
            let updatableFields = try UpdatableFields(reader: reader)
            let nodeFields = try NodeFields(reader: reader)
            fragments = Fragments(reactionFields: reactionFields, commentFields: commentFields, lockableFields: lockableFields, closableFields: closableFields, labelableFields: labelableFields, updatableFields: updatableFields, nodeFields: nodeFields)
          }

          public struct Fragments {
            public let reactionFields: ReactionFields
            public let commentFields: CommentFields
            public let lockableFields: LockableFields
            public let closableFields: ClosableFields
            public let labelableFields: LabelableFields
            public let updatableFields: UpdatableFields
            public let nodeFields: NodeFields
          }

          public struct Timeline: GraphQLMappable {
            public let __typename: String
            /// A list of nodes.
            public let nodes: [Node?]?

            public init(reader: GraphQLResultReader) throws {
              __typename = try reader.value(for: Field(responseName: "__typename"))
              nodes = try reader.optionalList(for: Field(responseName: "nodes"))
            }

            public struct Node: GraphQLMappable {
              public let __typename: String

              public let asCommit: AsCommit?
              public let asLabeledEvent: AsLabeledEvent?
              public let asUnlabeledEvent: AsUnlabeledEvent?
              public let asClosedEvent: AsClosedEvent?
              public let asReopenedEvent: AsReopenedEvent?
              public let asRenamedTitleEvent: AsRenamedTitleEvent?
              public let asLockedEvent: AsLockedEvent?
              public let asIssueComment: AsIssueComment?

              public init(reader: GraphQLResultReader) throws {
                __typename = try reader.value(for: Field(responseName: "__typename"))

                asCommit = try AsCommit(reader: reader, ifTypeMatches: __typename)
                asLabeledEvent = try AsLabeledEvent(reader: reader, ifTypeMatches: __typename)
                asUnlabeledEvent = try AsUnlabeledEvent(reader: reader, ifTypeMatches: __typename)
                asClosedEvent = try AsClosedEvent(reader: reader, ifTypeMatches: __typename)
                asReopenedEvent = try AsReopenedEvent(reader: reader, ifTypeMatches: __typename)
                asRenamedTitleEvent = try AsRenamedTitleEvent(reader: reader, ifTypeMatches: __typename)
                asLockedEvent = try AsLockedEvent(reader: reader, ifTypeMatches: __typename)
                asIssueComment = try AsIssueComment(reader: reader, ifTypeMatches: __typename)
              }

              public struct AsCommit: GraphQLConditionalFragment {
                public static let possibleTypes = ["Commit"]

                public let __typename: String
                /// Authorship details of the commit.
                public let author: Author?
                /// The Git commit message headline
                public let messageHeadline: String

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  author = try reader.optionalValue(for: Field(responseName: "author"))
                  messageHeadline = try reader.value(for: Field(responseName: "messageHeadline"))
                }

                public struct Author: GraphQLMappable {
                  public let __typename: String
                  /// The name in the Git commit.
                  public let name: String?
                  /// The timestamp of the Git action (authoring or committing).
                  public let date: String?

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    name = try reader.optionalValue(for: Field(responseName: "name"))
                    date = try reader.optionalValue(for: Field(responseName: "date"))
                  }
                }
              }

              public struct AsLabeledEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["LabeledEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'label' event.
                public let actor: Actor?
                /// Identifies the label associated with the 'labeled' event.
                public let label: Label
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  label = try reader.value(for: Field(responseName: "label"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }

                public struct Label: GraphQLMappable {
                  public let __typename: String
                  /// Identifies the label color.
                  public let color: String
                  /// Identifies the label name.
                  public let name: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    color = try reader.value(for: Field(responseName: "color"))
                    name = try reader.value(for: Field(responseName: "name"))
                  }
                }
              }

              public struct AsUnlabeledEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["UnlabeledEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'unlabel' event.
                public let actor: Actor?
                /// Identifies the label associated with the 'unlabeled' event.
                public let label: Label
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  label = try reader.value(for: Field(responseName: "label"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }

                public struct Label: GraphQLMappable {
                  public let __typename: String
                  /// Identifies the label color.
                  public let color: String
                  /// Identifies the label name.
                  public let name: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    color = try reader.value(for: Field(responseName: "color"))
                    name = try reader.value(for: Field(responseName: "name"))
                  }
                }
              }

              public struct AsClosedEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["ClosedEvent"]

                public let __typename: String
                /// Identifies the actor who closed the item.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsReopenedEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["ReopenedEvent"]

                public let __typename: String
                /// Identifies the actor who reopened the item.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsRenamedTitleEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["RenamedTitleEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'renamed' event.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String
                /// Identifies the current title of the issue or pull request.
                public let currentTitle: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))
                  currentTitle = try reader.value(for: Field(responseName: "currentTitle"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsLockedEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["LockedEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'locked' event.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsIssueComment: GraphQLConditionalFragment {
                public static let possibleTypes = ["IssueComment"]

                public let __typename: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))

                  let nodeFields = try NodeFields(reader: reader)
                  let reactionFields = try ReactionFields(reader: reader)
                  let commentFields = try CommentFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields, reactionFields: reactionFields, commentFields: commentFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                  public let reactionFields: ReactionFields
                  public let commentFields: CommentFields
                }
              }
            }
          }
        }

        public struct AsPullRequest: GraphQLConditionalFragment {
          public static let possibleTypes = ["PullRequest"]

          public let __typename: String
          /// A list of events associated with a PullRequest.
          public let timeline: Timeline
          /// Identifies the pull request number.
          public let number: Int
          /// Identifies the pull request title.
          public let title: String

          public let fragments: Fragments

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            timeline = try reader.value(for: Field(responseName: "timeline", arguments: ["first": reader.variables["page_size"]]))
            number = try reader.value(for: Field(responseName: "number"))
            title = try reader.value(for: Field(responseName: "title"))

            let reactionFields = try ReactionFields(reader: reader)
            let commentFields = try CommentFields(reader: reader)
            let lockableFields = try LockableFields(reader: reader)
            let closableFields = try ClosableFields(reader: reader)
            let labelableFields = try LabelableFields(reader: reader)
            let updatableFields = try UpdatableFields(reader: reader)
            let nodeFields = try NodeFields(reader: reader)
            fragments = Fragments(reactionFields: reactionFields, commentFields: commentFields, lockableFields: lockableFields, closableFields: closableFields, labelableFields: labelableFields, updatableFields: updatableFields, nodeFields: nodeFields)
          }

          public struct Fragments {
            public let reactionFields: ReactionFields
            public let commentFields: CommentFields
            public let lockableFields: LockableFields
            public let closableFields: ClosableFields
            public let labelableFields: LabelableFields
            public let updatableFields: UpdatableFields
            public let nodeFields: NodeFields
          }

          public struct Timeline: GraphQLMappable {
            public let __typename: String
            /// A list of nodes.
            public let nodes: [Node?]?

            public init(reader: GraphQLResultReader) throws {
              __typename = try reader.value(for: Field(responseName: "__typename"))
              nodes = try reader.optionalList(for: Field(responseName: "nodes"))
            }

            public struct Node: GraphQLMappable {
              public let __typename: String

              public let asCommit: AsCommit?
              public let asLabeledEvent: AsLabeledEvent?
              public let asUnlabeledEvent: AsUnlabeledEvent?
              public let asClosedEvent: AsClosedEvent?
              public let asReopenedEvent: AsReopenedEvent?
              public let asRenamedTitleEvent: AsRenamedTitleEvent?
              public let asLockedEvent: AsLockedEvent?
              public let asIssueComment: AsIssueComment?

              public init(reader: GraphQLResultReader) throws {
                __typename = try reader.value(for: Field(responseName: "__typename"))

                asCommit = try AsCommit(reader: reader, ifTypeMatches: __typename)
                asLabeledEvent = try AsLabeledEvent(reader: reader, ifTypeMatches: __typename)
                asUnlabeledEvent = try AsUnlabeledEvent(reader: reader, ifTypeMatches: __typename)
                asClosedEvent = try AsClosedEvent(reader: reader, ifTypeMatches: __typename)
                asReopenedEvent = try AsReopenedEvent(reader: reader, ifTypeMatches: __typename)
                asRenamedTitleEvent = try AsRenamedTitleEvent(reader: reader, ifTypeMatches: __typename)
                asLockedEvent = try AsLockedEvent(reader: reader, ifTypeMatches: __typename)
                asIssueComment = try AsIssueComment(reader: reader, ifTypeMatches: __typename)
              }

              public struct AsCommit: GraphQLConditionalFragment {
                public static let possibleTypes = ["Commit"]

                public let __typename: String
                /// Authorship details of the commit.
                public let author: Author?
                /// The Git commit message headline
                public let messageHeadline: String

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  author = try reader.optionalValue(for: Field(responseName: "author"))
                  messageHeadline = try reader.value(for: Field(responseName: "messageHeadline"))
                }

                public struct Author: GraphQLMappable {
                  public let __typename: String
                  /// The name in the Git commit.
                  public let name: String?
                  /// The timestamp of the Git action (authoring or committing).
                  public let date: String?

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    name = try reader.optionalValue(for: Field(responseName: "name"))
                    date = try reader.optionalValue(for: Field(responseName: "date"))
                  }
                }
              }

              public struct AsLabeledEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["LabeledEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'label' event.
                public let actor: Actor?
                /// Identifies the label associated with the 'labeled' event.
                public let label: Label
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  label = try reader.value(for: Field(responseName: "label"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }

                public struct Label: GraphQLMappable {
                  public let __typename: String
                  /// Identifies the label color.
                  public let color: String
                  /// Identifies the label name.
                  public let name: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    color = try reader.value(for: Field(responseName: "color"))
                    name = try reader.value(for: Field(responseName: "name"))
                  }
                }
              }

              public struct AsUnlabeledEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["UnlabeledEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'unlabel' event.
                public let actor: Actor?
                /// Identifies the label associated with the 'unlabeled' event.
                public let label: Label
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  label = try reader.value(for: Field(responseName: "label"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }

                public struct Label: GraphQLMappable {
                  public let __typename: String
                  /// Identifies the label color.
                  public let color: String
                  /// Identifies the label name.
                  public let name: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    color = try reader.value(for: Field(responseName: "color"))
                    name = try reader.value(for: Field(responseName: "name"))
                  }
                }
              }

              public struct AsClosedEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["ClosedEvent"]

                public let __typename: String
                /// Identifies the actor who closed the item.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsReopenedEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["ReopenedEvent"]

                public let __typename: String
                /// Identifies the actor who reopened the item.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsRenamedTitleEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["RenamedTitleEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'renamed' event.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String
                /// Identifies the current title of the issue or pull request.
                public let currentTitle: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))
                  currentTitle = try reader.value(for: Field(responseName: "currentTitle"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsLockedEvent: GraphQLConditionalFragment {
                public static let possibleTypes = ["LockedEvent"]

                public let __typename: String
                /// Identifies the actor who performed the 'locked' event.
                public let actor: Actor?
                /// Identifies the date and time when the object was created.
                public let createdAt: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  actor = try reader.optionalValue(for: Field(responseName: "actor"))
                  createdAt = try reader.value(for: Field(responseName: "createdAt"))

                  let nodeFields = try NodeFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                }

                public struct Actor: GraphQLMappable {
                  public let __typename: String
                  /// The username of the actor.
                  public let login: String

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    login = try reader.value(for: Field(responseName: "login"))
                  }
                }
              }

              public struct AsIssueComment: GraphQLConditionalFragment {
                public static let possibleTypes = ["IssueComment"]

                public let __typename: String

                public let fragments: Fragments

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))

                  let nodeFields = try NodeFields(reader: reader)
                  let reactionFields = try ReactionFields(reader: reader)
                  let commentFields = try CommentFields(reader: reader)
                  fragments = Fragments(nodeFields: nodeFields, reactionFields: reactionFields, commentFields: commentFields)
                }

                public struct Fragments {
                  public let nodeFields: NodeFields
                  public let reactionFields: ReactionFields
                  public let commentFields: CommentFields
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class RemoveReactionMutation: GraphQLMutation {
  public static let operationDefinition =
    "mutation RemoveReaction($subject_id: ID!, $content: ReactionContent!) {" +
    "  removeReaction(input: {subjectId: $subject_id, content: $content}) {" +
    "    __typename" +
    "    subject {" +
    "      __typename" +
    "      ...reactionFields" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(ReactionFields.fragmentDefinition)

  public let subjectId: GraphQLID
  public let content: ReactionContent

  public init(subjectId: GraphQLID, content: ReactionContent) {
    self.subjectId = subjectId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["subject_id": subjectId, "content": content]
  }

  public struct Data: GraphQLMappable {
    /// Removes a reaction from a subject.
    public let removeReaction: RemoveReaction?

    public init(reader: GraphQLResultReader) throws {
      removeReaction = try reader.optionalValue(for: Field(responseName: "removeReaction", arguments: ["input": ["subjectId": reader.variables["subject_id"], "content": reader.variables["content"]]]))
    }

    public struct RemoveReaction: GraphQLMappable {
      public let __typename: String
      /// The reactable subject.
      public let subject: Subject

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        subject = try reader.value(for: Field(responseName: "subject"))
      }

      public struct Subject: GraphQLMappable {
        public let __typename: String

        public let fragments: Fragments

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))

          let reactionFields = try ReactionFields(reader: reader)
          fragments = Fragments(reactionFields: reactionFields)
        }

        public struct Fragments {
          public let reactionFields: ReactionFields
        }
      }
    }
  }
}

public struct ReactionFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment reactionFields on Reactable {" +
    "  __typename" +
    "  viewerCanReact" +
    "  reactionGroups {" +
    "    __typename" +
    "    viewerHasReacted" +
    "    users {" +
    "      __typename" +
    "      totalCount" +
    "    }" +
    "    content" +
    "  }" +
    "}"

  public static let possibleTypes = ["Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReviewComment"]

  public let __typename: String
  /// Can user react to this subject
  public let viewerCanReact: Bool
  /// A list of reactions grouped by content left on the subject.
  public let reactionGroups: [ReactionGroup]?

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    viewerCanReact = try reader.value(for: Field(responseName: "viewerCanReact"))
    reactionGroups = try reader.optionalList(for: Field(responseName: "reactionGroups"))
  }

  public struct ReactionGroup: GraphQLMappable {
    public let __typename: String
    /// Whether or not the authenticated user has left a reaction on the subject.
    public let viewerHasReacted: Bool
    /// Users who have reacted to the reaction subject with the emotion represented by this reaction group
    public let users: User
    /// Identifies the emoji reaction.
    public let content: ReactionContent

    public init(reader: GraphQLResultReader) throws {
      __typename = try reader.value(for: Field(responseName: "__typename"))
      viewerHasReacted = try reader.value(for: Field(responseName: "viewerHasReacted"))
      users = try reader.value(for: Field(responseName: "users"))
      content = try reader.value(for: Field(responseName: "content"))
    }

    public struct User: GraphQLMappable {
      public let __typename: String
      /// Identifies the total count of items in the connection.
      public let totalCount: Int

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        totalCount = try reader.value(for: Field(responseName: "totalCount"))
      }
    }
  }
}

public struct CommentFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment commentFields on Comment {" +
    "  __typename" +
    "  author {" +
    "    __typename" +
    "    login" +
    "    avatarUrl" +
    "  }" +
    "  editor {" +
    "    __typename" +
    "    login" +
    "  }" +
    "  body" +
    "  createdAt" +
    "  viewerDidAuthor" +
    "}"

  public static let possibleTypes = ["Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReview", "PullRequestReviewComment", "GistComment"]

  public let __typename: String
  /// The actor who authored the comment.
  public let author: Author?
  /// The actor who edited the comment.
  public let editor: Editor?
  /// The comment body as Markdown.
  public let body: String
  /// Identifies the date and time when the object was created.
  public let createdAt: String
  /// Did the viewer author this comment.
  public let viewerDidAuthor: Bool

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    author = try reader.optionalValue(for: Field(responseName: "author"))
    editor = try reader.optionalValue(for: Field(responseName: "editor"))
    body = try reader.value(for: Field(responseName: "body"))
    createdAt = try reader.value(for: Field(responseName: "createdAt"))
    viewerDidAuthor = try reader.value(for: Field(responseName: "viewerDidAuthor"))
  }

  public struct Author: GraphQLMappable {
    public let __typename: String
    /// The username of the actor.
    public let login: String
    /// A URL pointing to the actor's public avatar.
    public let avatarUrl: String

    public init(reader: GraphQLResultReader) throws {
      __typename = try reader.value(for: Field(responseName: "__typename"))
      login = try reader.value(for: Field(responseName: "login"))
      avatarUrl = try reader.value(for: Field(responseName: "avatarUrl"))
    }
  }

  public struct Editor: GraphQLMappable {
    public let __typename: String
    /// The username of the actor.
    public let login: String

    public init(reader: GraphQLResultReader) throws {
      __typename = try reader.value(for: Field(responseName: "__typename"))
      login = try reader.value(for: Field(responseName: "login"))
    }
  }
}

public struct LockableFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment lockableFields on Lockable {" +
    "  __typename" +
    "  locked" +
    "}"

  public static let possibleTypes = ["Issue", "PullRequest"]

  public let __typename: String
  /// `true` if the object is locked
  public let locked: Bool

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    locked = try reader.value(for: Field(responseName: "locked"))
  }
}

public struct ClosableFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment closableFields on Closable {" +
    "  __typename" +
    "  closed" +
    "}"

  public static let possibleTypes = ["Issue", "PullRequest"]

  public let __typename: String
  /// true if the object is `closed` (definition of closed may depend on type)
  public let closed: Bool

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    closed = try reader.value(for: Field(responseName: "closed"))
  }
}

public struct LabelableFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment labelableFields on Labelable {" +
    "  __typename" +
    "  labels(first: 100) {" +
    "    __typename" +
    "    nodes {" +
    "      __typename" +
    "      color" +
    "      name" +
    "    }" +
    "  }" +
    "}"

  public static let possibleTypes = ["Issue", "PullRequest"]

  public let __typename: String
  /// A list of labels associated with the object.
  public let labels: Label?

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    labels = try reader.optionalValue(for: Field(responseName: "labels", arguments: ["first": 100]))
  }

  public struct Label: GraphQLMappable {
    public let __typename: String
    /// A list of nodes.
    public let nodes: [Node?]?

    public init(reader: GraphQLResultReader) throws {
      __typename = try reader.value(for: Field(responseName: "__typename"))
      nodes = try reader.optionalList(for: Field(responseName: "nodes"))
    }

    public struct Node: GraphQLMappable {
      public let __typename: String
      /// Identifies the label color.
      public let color: String
      /// Identifies the label name.
      public let name: String

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        color = try reader.value(for: Field(responseName: "color"))
        name = try reader.value(for: Field(responseName: "name"))
      }
    }
  }
}

public struct UpdatableFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment updatableFields on Updatable {" +
    "  __typename" +
    "  viewerCanUpdate" +
    "}"

  public static let possibleTypes = ["Project", "Issue", "CommitComment", "PullRequest", "IssueComment", "PullRequestReview", "PullRequestReviewComment", "GistComment"]

  public let __typename: String
  /// Check if the current viewer can update this object.
  public let viewerCanUpdate: Bool

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    viewerCanUpdate = try reader.value(for: Field(responseName: "viewerCanUpdate"))
  }
}

public struct NodeFields: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment nodeFields on Node {" +
    "  __typename" +
    "  id" +
    "}"

  public static let possibleTypes = ["Organization", "Project", "ProjectColumn", "ProjectCard", "Issue", "User", "Repository", "CommitComment", "Reaction", "Commit", "Status", "StatusContext", "Tree", "Ref", "PullRequest", "Label", "Integration", "IssueComment", "PullRequestCommit", "ReviewRequest", "PullRequestReview", "PullRequestReviewComment", "PullRequestReviewThread", "ClosedEvent", "ReopenedEvent", "SubscribedEvent", "UnsubscribedEvent", "MergedEvent", "ReferencedEvent", "AssignedEvent", "UnassignedEvent", "LabeledEvent", "UnlabeledEvent", "MilestonedEvent", "DemilestonedEvent", "RenamedTitleEvent", "LockedEvent", "UnlockedEvent", "DeployedEvent", "Deployment", "DeploymentStatus", "HeadRefDeletedEvent", "HeadRefRestoredEvent", "HeadRefForcePushedEvent", "BaseRefForcePushedEvent", "ReviewRequestedEvent", "ReviewRequestRemovedEvent", "ReviewDismissedEvent", "Language", "Milestone", "ProtectedBranch", "PushAllowance", "Team", "ReviewDismissalAllowance", "Release", "ReleaseAsset", "RepositoryTopic", "Topic", "Gist", "OrganizationIdentityProvider", "ExternalIdentity", "Blob", "Bot", "GistComment", "RepositoryInvitation", "Tag"]

  public let __typename: String
  /// ID of the object.
  public let id: GraphQLID

  public init(reader: GraphQLResultReader) throws {
    __typename = try reader.value(for: Field(responseName: "__typename"))
    id = try reader.value(for: Field(responseName: "id"))
  }
}