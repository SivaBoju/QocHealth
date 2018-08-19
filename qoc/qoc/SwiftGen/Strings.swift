// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

// swiftlint:disable file_length
// swiftlint:disable type_body_length
enum L10n {
  /// Apps
  case titleListView
  /// Detail
  case titleDetailView
  /// Top Apps
  case statusHeadline
  /// Fetching details...
  case statusSubHeadLine
  /// Release Date
  case titleReleaseDate
  /// Summary
  case titleSummary
  /// Price
  case titlePrice
  /// Category
  case titleCategory
  /// Publisher
  case titlePublisher
  /// Download
  case titleDownload
  /// Api service failed
  case failedApi
  /// No data available
  case failedData
  /// Mistaken taken
  case failedJson
  /// Unknown error
  case failedMisc
}
// swiftlint:enable type_body_length

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .titleListView:
        return L10n.tr(key: "titleListView")
      case .titleDetailView:
        return L10n.tr(key: "titleDetailView")
      case .statusHeadline:
        return L10n.tr(key: "statusHeadline")
      case .statusSubHeadLine:
        return L10n.tr(key: "statusSubHeadLine")
      case .titleReleaseDate:
        return L10n.tr(key: "titleReleaseDate")
      case .titleSummary:
        return L10n.tr(key: "titleSummary")
      case .titlePrice:
        return L10n.tr(key: "titlePrice")
      case .titleCategory:
        return L10n.tr(key: "titleCategory")
      case .titlePublisher:
        return L10n.tr(key: "titlePublisher")
      case .titleDownload:
        return L10n.tr(key: "titleDownload")
      case .failedApi:
        return L10n.tr(key: "failedApi")
      case .failedData:
        return L10n.tr(key: "failedData")
      case .failedJson:
        return L10n.tr(key: "failedJson")
      case .failedMisc:
        return L10n.tr(key: "failedMisc")
    }
  }

  private static func tr(key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

func tr(key: L10n) -> String {
  return key.string
}
