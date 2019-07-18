//
//  ServiceViewController.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

class ServiceViewController: UIViewController {
    
    var rootView: ServiceView { return self.view as! ServiceView }
    private let viewModel = ServiceViewModel()
    private let disposeBag = DisposeBag()
    fileprivate var serviceList = [Services]()
    
    override func loadView() {
        self.view = ServiceView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "VENPRO"
        prepareTableView()
        fetchServiceList()
    }
    
    private func prepareTableView() {
        let tv = rootView.tableView
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func fetchServiceList() {
        rootView.isLoadingViewHidden = false
        viewModel.getServicesList()
        .subscribeOn(MainScheduler.instance)
        .subscribe(onNext: {[weak self] (list) in
            self?.serviceList = list.sorted(by: {$0.name! < $1.name!})
            self?.rootView.tableView.reloadData()
            self?.rootView.isLoadingViewHidden = true
            }, onError: {[weak self] (error) in
                self?.rootView.isLoadingViewHidden = true
                self?.presentRepeatErrorController(title: "Ошибка", error: error, titleForAction: "OK", action: {_ in})
            }).disposed(by: disposeBag)
    }
    
}

extension ServiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.font = Const.Fonts.medium(with: 15)
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = serviceList[indexPath.row].name
        
        cell.detailTextLabel?.font = Const.Fonts.regular(with: 14)
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.text = serviceList[indexPath.row].cost
        return cell
    }
}

extension ServiceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
