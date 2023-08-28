//
//  NotesTableView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

public class NotesTableViewCell: UITableViewCell, ReusableView {
    
    private let containerView = UIViewBuilder()
        .build()
    
    private let stackView = UIStackViewBuilder()
        .spacing(8)
        .axis(.vertical)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoSemiBold, size: .xLarge))
        .textColor(.textSecondary)
        .build()
    
    private let noteLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .large))
        .textColor(.textPrimary)
        .numberOfLines(0)
        .build()
    
    var viewModel: NotesTableViewCellProtocol?
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
}

// MARK: - UILayout
extension NotesTableViewCell {
    
    private func addSubviews() {
        backgroundColor = .white
        addStackView()
    }
    
    private func addStackView() {
        addSubview(containerView)
        containerView.edgesToSuperview()
        containerView.widthToSuperview()
        
        containerView.addSubview(stackView)
        
        stackView.edgesToSuperview(insets: .left(24) + .right(24) + .top(24))
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(noteLabel)
    }
}

// MARK: - Set View Model
extension NotesTableViewCell {
    
    public func set(viewModel: NotesTableViewCellProtocol) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.noteLabel.text = viewModel.note
    }
}
