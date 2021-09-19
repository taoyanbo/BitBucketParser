/// Copyright (c) 2021 YANBO TAO
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import Alamofire

class DataViewModel {
    var datas: [Data] = []
  var next = "";
    var items: [Displayable] = []
  
    var reloadTableView: (()->())?
    var showError: (()->())?
  
    
   
    
  func fetchDatas(url: String) {
    //https://api.bitbucket.org/2.0/repositories
   
    AF.request(url).validate().responseDecodable(of: Datas.self) { (response) in
      switch response.result {
      case .success(_):
        guard let datas = response.value else { return }
        self.datas = datas.all
        self.items = datas.all
        self.next = datas.next
        self.reloadTableView?()
        print(datas)
      case let .failure(error):
        self.showError?()
        print(error)
      }
      
     
    }
 
  }
    
    var numberOfCells: Int {
        return datas.count
    }
    
    func getCellViewModel( row: Int ) -> Displayable {
        return items[row]
    }
  
  func getNextUrl() -> String {
    return self.next
  }
  
    
    
  
}



