//
//  HowItWorkVC.swift
//  prospeirty
//
//  Created by Aboelnaga on 24/05/2022.
//

import UIKit
//import ImageSlideshow

class HowItWorkVC: BaseViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var howItWorksCollection: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    private var currentpage = 0{
        didSet {
            setupView(true)
        }
    }
    private var changeNumberOnDisplay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setUpView() {
        nextButton.layer.cornerRadius = 10
    }
    
    func setupView(_ swipeCollection:Bool) {
            switch currentpage {
            case 0:
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "##1C1E25")
            case 1:
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "##1C1E25")
            case 2:
                nextButton.setTitle("Got it", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "#1473E6")
            case 3:
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "##1C1E25")
            case 4:
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "##1C1E25")
            case 5:
                nextButton.setTitle("Got it", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "#1473E6")
            default:
                nextButton.setTitle("Next", for: .normal)
                nextButton.backgroundColor = UIColor.init(hexString: "##1C1E25")
            }
        
            pageController.currentPage = currentpage
            if swipeCollection {
                howItWorksCollection.scrollToItem(at: IndexPath(row: currentpage, section: 0), at: .centeredHorizontally, animated: true)
            }else {
                howItWorksCollection.scrollToItem(at: IndexPath(row: currentpage, section: 0), at: .centeredHorizontally, animated: false)
                changeNumberOnDisplay = true
            }
        }
    
    func setupCollectionView() {
        howItWorksCollection.delegate = self
        howItWorksCollection.dataSource = self
        howItWorksCollection.register(UINib(nibName: String(describing: HowItWorksCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: HowItWorksCell.self))
        howItWorksCollection.isPagingEnabled = true
        howItWorksCollection.reloadData()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        pop()
    }
    
    @IBAction func nextButttonTapped(_ sender: Any) {
//        if currentpage < 6 {
//            let index = IndexPath.init(item: currentpage, section: 0)
//            self.howItWorksCollection.scrollToItem(at: index, at: .right, animated: true)
//            pageController.currentPage = currentpage
//            currentpage += 1
//                } else {
//                    print("done")
//            }
        if currentpage == 5 {
            //Done
            print("Done")
        }else {
            currentpage += 1
        }
    }
}

extension HowItWorkVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 6 }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HowItWorksCell.self), for: indexPath) as? HowItWorksCell
        else { return UICollectionViewCell() }
        cell.setup(with: indexPath)
        return cell
    }
}

extension HowItWorkVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.howItWorksCollection.frame.size.width
        let height = 444.0
        return CGSize(width: width, height: height)
    }
}

extension HowItWorkVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currentpage = Int(self.howItWorksCollection.contentOffset.x / self.howItWorksCollection.frame.size.width)
    }
}
