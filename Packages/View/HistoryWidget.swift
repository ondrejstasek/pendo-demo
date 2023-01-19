import Foundation
import SwiftUI

public struct HistoryWidget {

    public struct View: SwiftUI.View {

        @State var title: String
        @State var content: Content

        public init(
            title: String,
            content: Content
        ) {
            self.title = title
            self.content = content
        }

        public var body: some SwiftUI.View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .truncationMode(.tail)

                switch content {
                case .empty(let message):
                    HistoryWidget.EmptyPlaceholder(message: message)
                case .list(let list):
                    ForEach(list, content: itemView)
                }
            }
            .frame(maxWidth: .infinity)
        }

        @ViewBuilder private func itemView(_ item: HistoryWidget.ListItem) -> some SwiftUI.View {
            switch item {
            case .workOrder(let name, _):
                HistoryWidget.Row(imageName: "ic_widget_wo", name: name)
            case .asset(let name, _):
                HistoryWidget.Row(imageName: "ic_widget_asset", name: name)
            }
        }

    }

    struct Row: SwiftUI.View {

        @ScaledMetric var scale: CGFloat = 1

        let imageName: String
        let name: String

        var body: some SwiftUI.View {
            VStack(alignment: .leading) {
                Color.gray
                    .frame(height: 1)

                Button(action: {}) {
                    HStack {
                        Image(imageName, bundle: .module)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.gray)
                            .frame(width: 20 * scale, height: 20 * scale, alignment: .center)

                        Text(name)
                            .font(.body)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                    }
                }
            }
        }

    }

    struct EmptyPlaceholder: SwiftUI.View {

        let message: String

        var body: some SwiftUI.View {
            VStack {
                Image("pic_widget_no_history", bundle: .module)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70)

                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }

    }

    public enum Content {
        case empty(message: String)
        case list([ListItem])
    }

    public enum ListItem: Identifiable {
        case workOrder(name: String, id: Int)
        case asset(name: String, id: Int)

        public var id: String {
            switch self {
            case .workOrder(_, let id):
                return "wo-\(id)"
            case .asset(_, let id):
                return "a-\(id)"
            }
        }
    }

}
