//
//  DashboardViewController.swift
//  ProofOfConcept
//
//  Created by Yuvraj Sorav on 05/03/20.
//  Copyright (c) 2020 Yuvraj Sorav. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit



protocol DashboardDisplayLogic: class
{
    func displaySomething(viewModel: Dashboard.Something.ViewModel)
    func displayDashboardData(_ dashboardDataModel: DashboardModel)
}

class DashboardViewController: UIViewController, DashboardDisplayLogic
{
    var interactor: DashboardBusinessLogic?
    var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let router = DashboardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    let dashboardReuseIdentifier = "DashboardCellIdentifier"
    let tableview = UITableView()
    var dashboardModel : DashboardModel?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .red
        return refreshControl
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
        configureTableView()
        setUpInitials()
    }
    
    
    func configureTableView() {
        tableview.dataSource = self
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 80.0
        tableview.register(DashboardCell.self, forCellReuseIdentifier: dashboardReuseIdentifier)
        view.addSubview(tableview)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
    }
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = Dashboard.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Dashboard.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
    }
    
    func setUpInitials() {
        interactor?.doFetchDashBoardData()
    }
    
    func displayDashboardData(_ dashboardDataModel: DashboardModel) {
        dashboardModel = dashboardDataModel

        DispatchQueue.main.async {
            self.title = dashboardDataModel.title
            self.tableview.reloadData()
        }
    }
}
