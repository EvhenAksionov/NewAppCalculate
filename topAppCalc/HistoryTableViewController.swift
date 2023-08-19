import UIKit

class HistoryTableView: UIViewController{
    
    @IBOutlet private weak var historyTableView: UITableView!
    
    let identifire = "historyCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
extension HistoryTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

