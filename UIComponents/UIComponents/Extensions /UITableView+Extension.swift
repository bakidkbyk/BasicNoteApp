//
//  UITableView+Extension.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 28.08.2023.
//

public extension UITableView {
   
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            // swiftlint:disable fatal_error
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
            // swiftlint:enable fatal_error
        }
        return cell
    }
    
}
