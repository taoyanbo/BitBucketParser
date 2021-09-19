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

import UIKit
import Alamofire
import AlamofireImage

class MainTableViewController: UITableViewController {
  var dataViewModel = DataViewModel()
  var selectedItem: Displayable?
  
  
    @IBAction func onNext(_ sender: Any) {
        showAlert(dataViewModel.getNextUrl())
      dataViewModel.fetchDatas(url: dataViewModel.getNextUrl())
    }
    override func viewDidLoad() {
    super.viewDidLoad()
 
    
    initViewModel()
    
  }
  
  func initViewModel(){
      dataViewModel.reloadTableView = {
          DispatchQueue.main.async { self.tableView.reloadData() }
      }
      dataViewModel.showError = {
          DispatchQueue.main.async { self.showAlert("Ups, something went wrong.") }
      }
    
    dataViewModel.fetchDatas(url: "https://api.bitbucket.org/2.0/repositories")
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

         let headerCell = tableView.dequeueReusableCell(withIdentifier: "headCell") as! HeadViewCell
          
    return headerCell.contentView
      }
  

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataViewModel.numberOfCells
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataTableViewCell
    let item = dataViewModel.getCellViewModel(row: indexPath.row)
    cell.uiLabelName?.text = item.titleLabelText
    cell.uiLabelType?.text = item.subtitleLabelText
    cell.uiLabelDateTime?.text = item.createdDate.value
    
    let url = URL(string: item.avatar)!
    cell.uiImageView.sd_setImage(with:url)
   
   
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedItem = dataViewModel.getCellViewModel(row: indexPath.row)
    return indexPath
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let destinationVC = segue.destination as? DetailViewController else {
      return
    }
    destinationVC.data = selectedItem
  }
}




// MARK: - Alamofire
extension MainTableViewController {
  func showAlert( _ message: String ) {
      let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
      alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
      self.present(alert, animated: true, completion: nil)
  }
}
