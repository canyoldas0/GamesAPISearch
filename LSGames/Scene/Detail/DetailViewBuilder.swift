//
//  DetailViewBuilder.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class DetailViewBuilder {
    
    class func build(with request: GameDetailRequest) -> UIViewController {
        
        let dataHandler = DetailDataHandler()
        let detailVM = DetailVM(request: request, dataHandler: dataHandler)
        let detailVC = DetailVC(viewModel: detailVM)
        return detailVC
    }
}
