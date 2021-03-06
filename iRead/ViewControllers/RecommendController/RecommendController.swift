//
//  RecommendController.swift
//  iRead
//
//  Created by Simon on 16/3/8.
//  Copyright © 2016年 Simon. All rights reserved.
//

import UIKit
import Material

class RecommendController: YZDisplayViewController {
    
    lazy var headerBackgroundView: UIImageView = {
        let imageName = iReadTheme.isNightMode() ? "header_nightbg_recommand" : "header_bg_recommand"
        let headerBgImageView = UIImageView(image: UIImage(named: imageName))
        
        headerBgImageView.backgroundColor = UIColor(red: 66/255.0, green: 190/255.0, blue: 252/255.0, alpha: 1.0)
        headerBgImageView.layer.shadowColor = UIColor(red: 31/255.0, green: 31/255.0, blue: 31/255.0, alpha: 1.0).CGColor
        headerBgImageView.layer.shadowOffset = CGSizeMake(0, 4)
        headerBgImageView.layer.shadowRadius = 2
        headerBgImageView.layer.shadowOpacity = 0.3
        
        return headerBgImageView
    }()
    
    // MARK: - View Life Cycle ♻️
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareForNavigationBar()
        prepareForHeaderView()
        prepareForView()
        configureChildViewControllers()
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        view.layoutIfNeeded()
        print("rotation bug need to fix")
        
    }

    // 可以加个版本视图提供当数据加载
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UI Preparation 📱
    
    private func prepareForNavigationBar() {
        
        let titleLabel = UILabel()
        titleLabel.font = iReadFont.boldWithSize(18)
        titleLabel.text = "推荐"
        titleLabel.sizeToFit()
        titleLabel.textColor = iReadColor.themeWhiteColor
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: iReadTheme.isNightMode() ? "navigationbar_nightbg_recommand" : "navigationbar_bg_recommand"), forBarMetrics: .Default)
        navigationController!.navigationBar.shadowImage = UIImage()
        
    }
    
    private func prepareForView() {
        view.backgroundColor = iReadColor.themeModelBackgroundColor(dayColor: iReadColor.themeLightWhiteColor, nightColor: iReadColor.themeLightBlackColor)
    }
    
    private func prepareForHeaderView() {
        
        isShowUnderLine = true
        underLineColor = iReadColor.themeRedColor
        norColor = iReadColor.themeWhiteColor
        selColor = iReadColor.themeRedColor
        
        titleScrollViewBackgroundImageView = headerBackgroundView
        
        titleFont = iReadFont.thinWithSize(12)
        underLineH = 2
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    private func configureChildViewControllers() {
        let ITNewsVC = ITNewsViewController(feedType: .News)
        ITNewsVC.title = "科技见闻"
        addChildViewController(ITNewsVC)
        
        let TechStudyVC = TechStudyController(feedType: .Tech)
        TechStudyVC.title = "技术学习"
        addChildViewController(TechStudyVC)
        
        let LifeHealthVC = LifeHealthController(feedType: .Life)
        LifeHealthVC.title = "生活娱乐"
        addChildViewController(LifeHealthVC)
        
        let BlogArticleVC = BlogArticleController(feedType: .Blog)
        BlogArticleVC.title = "博客文摘"
        addChildViewController(BlogArticleVC)
        
    }
    
    
    
}