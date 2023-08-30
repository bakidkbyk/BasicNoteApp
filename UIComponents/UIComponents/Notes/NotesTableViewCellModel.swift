//
//  NotesTableViewModel.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

public protocol NotesTableViewCellDataSource: AnyObject {}

public protocol NotesTableViewCellEventSource: AnyObject {}

public protocol NotesTableViewCellProtocol: NotesTableViewCellDataSource, NotesTableViewCellEventSource {
    var id: Int { get set }
    var title: String { get set }
    var note: String { get set }
}

public final class NotesTableViewCellModel: NotesTableViewCellProtocol {
    
    public var id: Int
    public var title: String
    public var note: String
    
    public init(id: Int, title: String, note: String) {
        self.id = id
        self.title = title
        self.note = note
    }
}
