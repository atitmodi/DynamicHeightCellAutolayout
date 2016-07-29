//
//  DynamicHeightCellAutolayout.swift
//  DynamicCellHeight
//
//  Created by Atit Modi on 7/22/16.
//  Copyright © 2016 Atit Modi. All rights reserved.
//
import UIKit
import HCSStarRatingView
import Font_Awesome_Swift

@objc protocol ReviewRatedTableViewCellDelegate : NSObjectProtocol
{
    optional func moreBtnClicked(cellIndex : Int)
    optional func likeBtnClicked(cellIndex : Int)
}

class ReviewRatedTableViewCell: UITableViewCell
{
    weak var delegate : ReviewRatedTableViewCellDelegate?
    var profileImg : UIImageView?
    var nameLbl : UILabel?
    var messageLbl : UILabel?
    var ratingImg : HCSStarRatingView?
    var flagImg : UIImageView?
    var isConstraintsApplied : Bool = false
    var viewDictionary : [String : AnyObject]?
    var metricDictionary : [String : AnyObject]?
    var profileViewContainer : UIView?
    var messageViewContainer : UIView?
    var dateLbl : UILabel?
    var moreBtn : UIButton?
    var likeBtn : UIButton?
    var likesLbl : UILabel?
    var likeViewContainer : UIView?
    var separatorView : UIView?
    var bottomSeparatorView : UIView?
    var cellIndex : Int = 0
    var isExpanded : Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        
        //this dictionary contains all views which needs to be layout
        viewDictionary = [:]
        //this dictionary contains constant values to define the size of the view in autolayout
        metricDictionary = [:]
        
        //container view for user profile related content
        profileViewContainer = UIView()
        profileViewContainer!.translatesAutoresizingMaskIntoConstraints = false
        profileViewContainer!.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Horizontal)
        self.contentView.addSubview(profileViewContainer!)
        
        //container view for user's review related content
        messageViewContainer = UIView()
        messageViewContainer!.translatesAutoresizingMaskIntoConstraints = false
        messageViewContainer!.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Horizontal)
        self.contentView.addSubview(messageViewContainer!)
        
        profileImg = UIImageView()
        profileImg!.translatesAutoresizingMaskIntoConstraints = false
        profileImg!.contentMode = UIViewContentMode.ScaleAspectFit
        profileImg!.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Vertical)
        profileViewContainer!.addSubview(profileImg!)
        
        flagImg = UIImageView()
        flagImg!.translatesAutoresizingMaskIntoConstraints = false
        flagImg!.contentMode = UIViewContentMode.ScaleAspectFit
        flagImg!.backgroundColor = UIColor.redColor()
        profileViewContainer!.addSubview(flagImg!)
        
        dateLbl = UILabel()
        dateLbl!.translatesAutoresizingMaskIntoConstraints = false
        dateLbl!.text = "February 2016"
        dateLbl!.textColor = UIColor.TabSelectedColor()
        dateLbl!.minimumScaleFactor = 0.7
        dateLbl!.adjustsFontSizeToFitWidth = true
        dateLbl!.numberOfLines = 0
        dateLbl!.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Vertical)
        dateLbl!.textAlignment = NSTextAlignment.Center
        dateLbl!.font = UIFont.myFont(1.2 * Constants.padding)
        profileViewContainer!.addSubview(dateLbl!)
        
        nameLbl = UILabel()
        nameLbl!.translatesAutoresizingMaskIntoConstraints = false
        nameLbl!.textColor = UIColor.darkGrayColor()
        nameLbl!.minimumScaleFactor = 0.7
        nameLbl!.adjustsFontSizeToFitWidth = true
        nameLbl!.font = UIFont.myFont(Constants.padding * 1.2, bold: true)
        nameLbl!.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Vertical)
        messageViewContainer!.addSubview(nameLbl!)
        
        // Review Text
        messageLbl = UILabel()
        messageLbl!.translatesAutoresizingMaskIntoConstraints = false
        messageLbl!.textColor = UIColor.darkGrayColor()
        messageLbl!.lineBreakMode = .ByWordWrapping
        messageLbl!.textAlignment = NSTextAlignment.Center
        messageLbl!.minimumScaleFactor = 0.7
        messageLbl!.adjustsFontSizeToFitWidth = true
        messageLbl!.font = UIFont.myFont(1.2 * Constants.padding)
        messageLbl!.numberOfLines = 4
        messageLbl!.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Vertical)
        messageLbl!.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: UILayoutConstraintAxis.Vertical)
        messageViewContainer!.addSubview(messageLbl!)
        
        moreBtn = UIButton()
        moreBtn!.translatesAutoresizingMaskIntoConstraints = false
        moreBtn!.setTitle("+More", forState: UIControlState.Normal)
        moreBtn!.setTitleColor(UIColor.FilterBtnColor(), forState: UIControlState.Normal)
        moreBtn!.titleLabel!.font = UIFont.myFont(Constants.padding * 1.2, bold: true)
        moreBtn!.titleLabel!.textAlignment = NSTextAlignment.Left
        moreBtn!.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        moreBtn!.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Vertical)
        moreBtn!.addTarget(self, action: "moreBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        messageViewContainer!.addSubview(moreBtn!)
        
        ratingImg = HCSStarRatingView()
        ratingImg!.translatesAutoresizingMaskIntoConstraints = false
        ratingImg!.tintColor = UIColor.TabHighlightedColor()
        ratingImg!.enabled = false
        ratingImg!.backgroundColor = UIColor.clearColor()
        ratingImg!.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Vertical)
        ratingImg!.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: UILayoutConstraintAxis.Vertical)
        messageViewContainer!.addSubview(ratingImg!)
        
        likeViewContainer = UIView()
        likeViewContainer!.translatesAutoresizingMaskIntoConstraints = false
        likeViewContainer!.userInteractionEnabled = true
        likeViewContainer!.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Vertical)
        likeViewContainer!.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: UILayoutConstraintAxis.Vertical)
        messageViewContainer!.addSubview(likeViewContainer!)
        
        likeBtn = UIButton()
        likeBtn!.translatesAutoresizingMaskIntoConstraints = false
        likeBtn!.setFAIcon(FAType.FAThumbsOUp, iconSize: Constants.padding * 2,forState: UIControlState.Normal)
        likeBtn!.setTitleColor(UIColor.LikeBtnColor(), forState: UIControlState.Normal)
        likeBtn!.setTitleColor(UIColor.TabHighlightedColor(), forState: UIControlState.Selected)
        likeBtn!.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        likeBtn!.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        likeBtn!.addTarget(self, action: "likeBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        likeViewContainer!.addSubview(likeBtn!)
        
        //seprates like button and like label
        separatorView = UIButton()
        separatorView!.translatesAutoresizingMaskIntoConstraints = false
        separatorView!.backgroundColor = UIColor.TabBarSeparatorColor()
        separatorView!.userInteractionEnabled = true
        likeViewContainer!.addSubview(separatorView!)
        
        likesLbl = UILabel()
        likesLbl!.translatesAutoresizingMaskIntoConstraints = false
        likesLbl!.text = "5"
        likesLbl!.font = UIFont.myFont(1.3 * Constants.padding)
        likesLbl!.textColor = UIColor.FilterBtnColor()
        likesLbl!.userInteractionEnabled = true
        likesLbl!.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Vertical)
        likeViewContainer!.addSubview(likesLbl!)
        
        //seprates two cells with custom color
        bottomSeparatorView = UIView()
        bottomSeparatorView!.translatesAutoresizingMaskIntoConstraints = false
        bottomSeparatorView!.backgroundColor = UIColor.EventCellBackColor()
        self.contentView.addSubview(bottomSeparatorView!)
        
        viewDictionary!["profileImg"] = profileImg!
        viewDictionary!["flagImg"] = flagImg!
        viewDictionary!["nameLbl"] = nameLbl!
        viewDictionary!["messageLbl"] = messageLbl!
        viewDictionary!["ratingImg"] = ratingImg!
        viewDictionary!["messageViewContainer"] = messageViewContainer!
        viewDictionary!["profileViewContainer"] = profileViewContainer!
        viewDictionary!["dateLbl"] = dateLbl!
        viewDictionary!["separatorView"] = separatorView!
        viewDictionary!["likeBtn"] = likeBtn!
        viewDictionary!["likesLbl"] = likesLbl!
        viewDictionary!["moreBtn"] = moreBtn!
        viewDictionary!["bottomSeparatorView"] = bottomSeparatorView!
        viewDictionary!["likeViewContainer"] = likeViewContainer!
        
        metricDictionary!["padding"] = Constants.padding
        metricDictionary!["padding_half"] = Constants.padding / 2
        metricDictionary!["padding2x"] = Constants.padding * 2
        metricDictionary!["padding3x"] = Constants.padding * 3
        metricDictionary!["paddingExtra"] = Constants.padding * 6
        metricDictionary!["bottomSeparatorView_H"] = 1
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints()
    {
        super.updateConstraints()
        
        if !isConstraintsApplied
        {
            self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding_half-[profileViewContainer][bottomSeparatorView(1)]-padding_half-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding_half-[messageViewContainer][bottomSeparatorView(1)]-padding_half-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[profileViewContainer][messageViewContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bottomSeparatorView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            let messageViewContainer_W = NSLayoutConstraint(item: messageViewContainer!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Width, multiplier: 0.75, constant: 0)
            self.contentView.addConstraints([messageViewContainer_W])
            
            profileViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding-[profileImg]-padding_half-[flagImg]-padding_half-[dateLbl]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            profileViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding_half-[dateLbl]-padding_half-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            
            //defining Profile image constraints

            let profile_equal_W_H = NSLayoutConstraint(item: profileImg!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: profileImg!, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
            
            let profile_W = NSLayoutConstraint(item: profileImg!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: profileViewContainer!, attribute: NSLayoutAttribute.Width, multiplier: 0.80, constant: 0)
            
            let profile_Img_CenterX =  NSLayoutConstraint(item: profileImg!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: profileViewContainer!, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
            
            let profile_Img_H =  NSLayoutConstraint(item: profileImg!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: profileImg!, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0)
            
            //defining flag image constraints

            let flag_W = NSLayoutConstraint(item: flagImg!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: profileImg!, attribute: NSLayoutAttribute.Width, multiplier: 0.4, constant: 0)
            
            let flag_CenterX = NSLayoutConstraint(item: flagImg!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: profileViewContainer!, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
            
            let flagImg_H =  NSLayoutConstraint(item: flagImg!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: profileViewContainer!, attribute: NSLayoutAttribute.Width, multiplier: 0.15, constant: 0)
            
            profileViewContainer!.addConstraints([profile_equal_W_H, profile_W, profile_Img_CenterX, profile_Img_H, flag_W, flag_CenterX, flagImg_H])
            
            //defining rating image constraints
            let rating_H = NSLayoutConstraint(item: ratingImg!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 45)
            
            let rating_W = NSLayoutConstraint(item: ratingImg!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 100)
            
            messageViewContainer!.addConstraints([rating_H, rating_W])
            
            messageViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding-[nameLbl]-padding_half-[messageLbl][moreBtn][ratingImg]-padding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            messageViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-padding-[nameLbl]-padding_half-[messageLbl][moreBtn][likeViewContainer]-padding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            messageViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[nameLbl]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            messageViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[messageLbl]-padding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            messageViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[moreBtn][likeViewContainer]-padding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            messageViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[ratingImg][likeViewContainer]-padding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            likeViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[likeBtn(==likeViewContainer)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            likeViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[separatorView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            likeViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[likesLbl]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
            
            // defining separatorView height between like button and like label
            let separatorView_H = NSLayoutConstraint(item: separatorView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: likeViewContainer!, attribute: NSLayoutAttribute.Height, multiplier: 0.9, constant: 0)
            
            likeViewContainer!.addConstraints([separatorView_H])
            
            likeViewContainer!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-padding-[likeBtn]-padding_half-[separatorView(2)]-padding_half-[likesLbl]-padding-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metricDictionary!, views: viewDictionary!))
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
    
    //MARK: Button Click Event
    func moreBtnClicked()
    {
        if delegate != nil
        {
            delegate!.moreBtnClicked!(cellIndex)
        }
    }
    
    func likeBtnClicked()
    {
        if delegate != nil
        {
            delegate!.likeBtnClicked!(cellIndex)
        }
    }
    
    //MARK: Touch event
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first! as UITouch
        
        if touch.view == likeViewContainer || touch.view == likesLbl || touch.view == separatorView
        {
            likeBtnClicked()
        }
    }
    
    deinit
    {
        self.subviews.forEach({$0.removeFromSuperview()})
        
        if viewDictionary != nil
        {
            viewDictionary = nil
        }
        
        if metricDictionary != nil
        {
            metricDictionary = nil
        }
    }
}
