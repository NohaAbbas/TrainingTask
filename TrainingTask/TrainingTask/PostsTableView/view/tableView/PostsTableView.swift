//
//  PostsTableView.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/6/23.
//

import UIKit

class PostsTableView: UITableView {
    
    var postsArray = [Post]()
    var postsDelegate: PostTableViewProtocol?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setupPostsTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureWith(array: [Post]) {
        postsArray = array
        reloadData()
        scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
    private func setupPostsTableView() {
        register(UINib(nibName: PostTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: PostTableViewCell.IDENTIFIER)
        dataSource = self
        delegate = self
        separatorStyle = .none
        showsVerticalScrollIndicator = false
    }
    
}

extension PostsTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.IDENTIFIER, for: indexPath) as! PostTableViewCell
        cell.setup(with: postsArray[indexPath.row])
        return cell
    }

}

extension PostsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postsDelegate?.postCellClicked(selectedPostPosition: indexPath.row)
    }
}
