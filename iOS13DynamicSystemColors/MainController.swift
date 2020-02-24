//
//  ContentView.swift
//  iOS13DynamicSystemColors
//
//  Created by Art Arriaga on 2/20/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//

import SwiftUI

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let sectionLabels = ["Label Colors", "SystemFill Colors", "Standard Content Background Colors", "Grouped Content Background Colors"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishSetup()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Delegate and DataSource
extension MainController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
           return labelColors.count
        case 1:
           return systemFillColors.count
        case 2:
           return standardContentBackgroundColors.count
        default:
           return groupedContentBackgroundColors.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as! HeaderCell
        switch indexPath.section {
          case 0:
            headerCell.sectionTitleLabel.text = self.sectionLabels[0]
          case 1:
             headerCell.sectionTitleLabel.text = self.sectionLabels[1]
          case 2:
             headerCell.sectionTitleLabel.text = self.sectionLabels[2]
          default:
             headerCell.sectionTitleLabel.text = self.sectionLabels[3]
          }
        return headerCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        switch indexPath.section {
        case 0:
            if indexPath.item == 0 {
                cell.colorNameLabel.textColor = .gray
                cell.colorDescriptionLabel.textColor = .gray
            }
            cell.dynamicColor = labelColors[indexPath.item]
        case 1:
            cell.dynamicColor = systemFillColors[indexPath.item]
        case 2:
            cell.dynamicColor = standardContentBackgroundColors[indexPath.item]
        default:
            cell.dynamicColor = groupedContentBackgroundColors[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.size.width, height: 50)
    }
}

//MARK: Finish Setup
extension MainController {
    fileprivate func finishSetup() {
        self.collectionView.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Dynamic Colors"
        registerCells()
    }
    
    fileprivate func registerCells() {
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        self.collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseIdentifier)
    }
}

//MARK: Canvas Preview
struct MainControllerView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: MainControllerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainControllerView>) {
        
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<MainControllerView>) -> UIViewController {
        return MainController()
    }
}

struct MainController_Previews: PreviewProvider {
    static var previews: some View {
        MainControllerView().edgesIgnoringSafeArea(.all)
    }
}
