import CQlift


open class QMenu: QWidget {
    public var title: String {
        get {
            return String(cString: QMenu_title(self.ptr))
        }
        set(newTitle) {
            QMenu_setTitle(self.ptr, newTitle)
        }
    }

    public init(title: String? = nil, parent: QWidget? = nil) {
        super.init(ptr: QMenu_new(title, parent?.ptr))
    }

    override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    public func menuAction() -> QAction {
        return QAction(ptr: QMenu_menuAction(self.ptr))
    }

    deinit {
        if self.ptr != nil {
            if QObject_parent(self.ptr) == nil {
                QMenu_delete(self.ptr)
            }
            self.ptr = nil
        }
    }
}
