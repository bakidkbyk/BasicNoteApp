//
//  NotesViewController.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

final class NotesViewController: BaseViewController<NotesViewModel> {

    let searchController = UISearchController(searchResultsController: nil)
    
    private let tableView = UITableViewBuilder()
        .build()
    
    private let actionNoteButton = ButtonFactory.createPrimaryButton(style: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
    }
}

// MARK: - UILayout
extension NotesViewController {
    
    private func addSubviews() {
        addTableView()
        addNoteButton()
    }
    
    private func addSearchBar() {
        
    }
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
    
    private func addNoteButton() {
        view.addSubview(actionNoteButton)
        actionNoteButton.centerXToSuperview()
        actionNoteButton.bottomToSuperview(usingSafeArea: true).constant = -24
    }
}

// MARK: - Configure Contents and Localize
extension NotesViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.setShowsCancelButton(false, animated: false)
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotesTableViewCell.self)
    }
    
    private func setLocalize() {
        searchController.searchBar.placeholder = L10n.Notes.searchBarPlaceHolder
        actionNoteButton.setTitle(L10n.Notes.addNoteButton, for: .normal)
    }
}

// MARK: - Actions

// MARK: Search Controller
extension NotesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("DEBUG PRINT:", searchController.searchBar.text)
    }
}

// MARK: - UITableView Delegate
extension NotesViewController: UITableViewDelegate {}

// MARK: - UITableView Data Source
extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotesTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath)
        cell.set(viewModel: cellItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
}
