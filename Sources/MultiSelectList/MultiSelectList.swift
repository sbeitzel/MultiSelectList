import SwiftUI

/// UI View which presents a list of items, any number of which may
/// be selected. Each item must conform to `Identifiable` and
/// to `Hashable`.
public struct MultiSelectList<T: Identifiable & Hashable>: View {
    private let items: [T]
    private let modified: (Set<T>) -> Void
    private let itemString: (T) -> String

    @State private var selected: Set<T>

    /// Initialize a MultiSelectItemList
    ///
    /// - Parameters:
    ///   - items: the items to be displayed
    ///   - selected: the currently selected items
    ///   - modified: callback, called when the selection changes
    ///   - itemString: method to get a displayable string label for a given item
    public init(items: [T], selected: Set<T>, modified: @escaping (Set<T>) -> Void, itemString: @escaping (T) -> String) {
        self.items = items
        self.modified = modified
        self.itemString = itemString
        _selected = State(wrappedValue: selected)
    }

    public var body: some View {
        ScrollView {
            ForEach(items) { item in
                MultiSelectRow(
                    item: item,
                    selected: selected.contains(item),
                    action: {
                        if selected.contains(item) {
                            selected.remove(item)
                        } else {
                            selected.insert(item)
                        }
                        modified(selected)
                    },
                    itemString: itemString
                )
            }
        }
    }
}
