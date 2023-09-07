//
//  NotesViewController.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

import UIKit

final class NotesViewController: BaseViewController<NotesViewModel> {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private let profileButton = UIButton(type: .custom)
    
    private let tableView = UITableViewBuilder()
        .build()
    
    private let actionNoteButton = ButtonFactory.createPrimaryButton(style: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        setNavigationProfileIcon()
        setNavigationMenuIcon()
    }
}

// MARK: - UILayout
extension NotesViewController {
    
    private func addSubviews() {
        addTableView()
        addNoteButton()
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
        
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotesTableViewCell.self)
        
        actionNoteButton.addTarget(self, action: #selector(addNoteButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        searchController.searchBar.placeholder = L10n.Notes.searchBarPlaceHolder
        actionNoteButton.setTitle(L10n.Notes.addNoteButton, for: .normal)
    }
    
    private func setNavigationProfileIcon() {
        profileButton.setImage(UIImage.imgUser, for: UIControl.State.normal)
        profileButton.addTarget(self, action: #selector(profileImageTapped), for: UIControl.Event.touchUpInside)
        
        let barButton = UIBarButtonItem(customView: profileButton)
        
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    private func setNavigationMenuIcon() {
        let menuImage = UIImage.icMenu
        menuImage.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuImage, style: .done, target: self, action: nil)
    }
}

// MARK: - Actions
extension NotesViewController {
    
    @objc
    func addNoteButtonTapped() {
        viewModel.showEditNote()
    }
}

// MARK: - Actions
extension NotesViewController {
    
    @objc
    func profileImageTapped() {
        // TODO: - Profil Sayfasına yönlendirme yapılacak.
    }
}

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
