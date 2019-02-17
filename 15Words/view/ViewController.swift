//
//  ViewController.swift
//  15Words
//
//  Created by Ayoze Pérez Rodríguez on 17.01.19.
//  Copyright © 2019 AyoPrez. All rights reserved.
//

import UIKit
import Flurry_iOS_SDK

class ViewController: UIViewController {


    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var banner: UIView!
    
    //adBanner
    let adBanner = FlurryAdBanner(space: "ADSPACE")
    

    let cellIds = ["cell_hello","cell_goodbye","cell_thanks","cell_yes", "cell_no", "cell_please", "cell_ok","cell_sorry","cell_help","cell_welcome", "cell_how", "cell_wc", "cell_beer","cell_morning","cell_night"]
    let cellSizes = Array( repeatElement(CGSize(width:80, height:80), count: 15))
    let smallCellSizes = Array (repeatElement(CGSize(width: 60, height: 60), count: 15))
    let bigCellSizes = Array (repeatElement(CGSize(width: 190, height: 190), count: 15))
    
    var presenter: MainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter = MainPresenter(delegate: self)
        
        collectionview.delegate = self
        collectionview.dataSource = self
        
        adBanner?.adDelegate = self
        adBanner?.fetchAndDisplayAd(in: banner, viewControllerForPresentation: self)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on: \(cellIds[indexPath.row])")
        
        //Replace this for a enum
        presenter?.getWordsByEmoji(emojiType: 0)
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellIds.count
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return self.bigCellSizes[indexPath.item]
        } else {
            if UIScreen.main.nativeBounds.height < 1792 {
                return smallCellSizes[indexPath.item]
            } else {
                return cellSizes[indexPath.item]
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11.25, left: 11.25, bottom: 11.25, right: 11.25)
    }
    
}

extension ViewController: FlurryAdBannerDelegate {
    
    func adBannerDidFetchAd(_ bannerAd: FlurryAdBanner!) {
        adBanner?.displayAd(in: banner, viewControllerForPresentation: self)
    }
}

extension ViewController: MainPresenterDelegate {
    
    func showWaitingDialog() {
        
    }
    
    func closeWaitingDialog() {
        
    }
    
}
