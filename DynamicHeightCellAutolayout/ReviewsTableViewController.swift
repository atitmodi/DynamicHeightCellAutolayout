//
//  DynamicHeightCellAutolayout.swift
//  DynamicCellHeight
//
//  Created by Atit Modi on 7/22/16.
//  Copyright © 2016 Atit Modi. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UITableViewController, ReviewRatedTableViewCellDelegate
{
    
    var rating : CGFloat?
    var reviews: [ReviewModel!]?
    
    
    // bool array for more buttton clicked
    var selectedCellIndex : Array<Bool> = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //fetching all models from provider
        let providerModel = ReviewProviderModel()
        reviews = providerModel.getReviewModels()
        
        //by default all cells will be collapsed, hence bool is set to false for all index's
        /*
        
        this array of bool (selectedCellIndex) is set to false when application starts so that all cells
        are collapsed, when user clicks on more button bool for particular index in set to true and cell is
        expanded
        
        */
        for _ in reviews! {
            
            self.selectedCellIndex.append(false)
        }
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.separatorColor = UIColor.greenColor()
        self.tableView.showsVerticalScrollIndicator = false
        // dynamic height
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        // dynamic height
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // to update the constraints of the cell
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("reviewCell") as? ReviewRatedTableViewCell
        
        let model = reviews![indexPath.row]
        
        if cell == nil
        {
            cell = ReviewRatedTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reviewCell")
            cell!.delegate = self
        }
        
        //review label text aligment Justified
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Justified
        cell!.messageLbl!.attributedText = NSAttributedString(string: model.userReview!, attributes: [NSParagraphStyleAttributeName: paragraphStyle,         NSBaselineOffsetAttributeName: NSNumber(float: 0)])
        
        //to hide more button based on number of characters(approximate calculation 2 to 3 lines)
        if model.userReview!.characters.count > 120
        {
            cell!.moreBtn!.hidden = false
            
        }
        else{
            cell!.moreBtn!.hidden = true
            
        }
        
        //set margin zero from all sides
        cell!.layoutMargins = UIEdgeInsetsZero
        
        cell!.messageLbl!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        //cell!.messageLbl!.numberOfLines = 4
        
        // expand and collapse cell according to bool set for that index
        if(self.selectedCellIndex[indexPath.row]){
            cell!.messageLbl!.numberOfLines = 0
        }
        else{
            cell!.messageLbl!.numberOfLines = 4
            
        }
        
        cell!.profileImg!.image = model.userProfileImage!.rounded
        cell!.nameLbl!.text = model.userName
        cell!.nameLbl!.font =  UIFont.myFont(1.5 * Constants.padding, bold: true)
        cell!.ratingImg!.value = rating == nil ? CGFloat(indexPath.row + 1) : rating!
        cell!.ratingImg!.maximumValue = 5
        cell!.dateLbl!.text = model.date!
        cell!.cellIndex = indexPath.row
        cell!.likeBtn!.tag = indexPath.row
        
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        cell!.preservesSuperviewLayoutMargins = false
        
        return cell!
    }
    
    //MARK: Delagte Method of cell
    
    func moreBtnClicked(cellIndex : Int)
    {
        let indexPath = NSIndexPath(forRow: cellIndex, inSection: 0)
        
        //Setting true and false for cell index
        self.selectedCellIndex[cellIndex] = !self.selectedCellIndex[cellIndex]
        
        tableView.reloadData()
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Middle, animated: true)
        
    }
    
    
    func likeBtnClicked(cellIndex : Int)
    {
        
        let indexPath = NSIndexPath(forItem: cellIndex, inSection: 0)
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! ReviewRatedTableViewCell
        
        if (!cell.likeBtn!.selected && cell.likeBtn!.tag == cellIndex)
        {
            cell.likeBtn!.selected = true
            cell.likesLbl!.text = String(Int(cell.likesLbl!.text!)! + 1)
        }
        else if (cell.likeBtn!.tag == cellIndex)
        {
            cell.likeBtn!.selected = false
            cell.likesLbl!.text = String(Int(cell.likesLbl!.text!)! - 1)
        }
    }
    
}
