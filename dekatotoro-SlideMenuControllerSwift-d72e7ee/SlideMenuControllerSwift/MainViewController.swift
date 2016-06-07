//
//  ViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var mainContens = ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10", "data11", "data12", "data13", "data14", "data15"]
    var mainContents: Array<String> = []
    //var mainContents = NSArray(contentsOfFile: NSBundle.mainBundle() + "/Source/test.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerCellNib(DataTableViewCell.self)
        
        let diaryList:NSString = NSBundle.mainBundle().pathForResource("test2", ofType:"plist")!
        print("\(diaryList)")
       // var data:NSArray = NSArray(contentsOfFile:diaryList as String)!
        self.mainContents = NSArray(contentsOfFile: diaryList as String)! as! Array<String>
        print(self.mainContents)
        
        /*let home = NSHomeDirectory() as NSString;
        /// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.stringByAppendingPathComponent("test2.plist") as NSString;
        /// 3、获取文本文件路径
        //let filePath = docPath.stringByAppendingPathComponent("data2.plist");
        var dataSource = NSMutableArray();
        dataSource.addObject("衣带渐宽终不悔");
        dataSource.addObject("为伊消得人憔悴");
        dataSource.addObject("故国不堪回首明月中");
        dataSource.addObject("人生若只如初见");
        dataSource.addObject("暮然回首，那人却在灯火阑珊处");
        /// 4、将数据写入文件中
        dataSource.writeToFile(docPath as String, atomically: true);
        /// 5、输出沙盒路径
        print("\(docPath)");*/

        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //函数是在SlideMenuControllerSwift中定义的，这里可以用是因为，定义在UIViewController extension中
        self.setNavigationBarItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension MainViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DataTableViewCell.height()
    }
}

extension MainViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainContents.count
    }
     
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(DataTableViewCell.identifier) as! DataTableViewCell
        
        //var num = indexPath.section % 8
        //let content = self.mainContents?["\(num)"]
        //let url = content![indexPath.row]["url"] as! String
        //let name = content![indexPath.row]["name"] as! String
        //let data = DataTableViewCellData(imageUrl: "dummy", text: content as! String)
        
        let data = DataTableViewCellData(imageUrl: "dummy", text: mainContents[indexPath.row])
        cell.setData(data)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "SubContentsViewController", bundle: nil)
        let subContentsVC = storyboard.instantiateViewControllerWithIdentifier("SubContentsViewController") as! SubContentsViewController
        self.navigationController?.pushViewController(subContentsVC, animated: true)
    }
}

extension MainViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
