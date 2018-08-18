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
