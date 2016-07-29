//
//  ReviewProviderModel.swift
//  DynamicCellHeight
//
//  Created by Atit Modi on 7/22/16.
//  Copyright © 2016 Atit Modi. All rights reserved.
//

import UIKit

class ReviewProviderModel: NSObject {
    
    
    func getReviewModels()->[ReviewModel!]{
        
        var profiles: [ReviewModel!] = []
        
        let profile1 = ReviewModel()
        profile1.userName = "Atit Modi"
        profile1.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD.  a."
        profile1.date = "July 2016"
        profile1.profileLikeCount = "10"
        profile1.userProfileImage = UIImage(named: "profileImg.png")
        profiles.append(profile1)
        
        
        let profile2 = ReviewModel()
        profile2.userName = "John Stone"
        profile2.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. They organised the state into two duchies by the 9th century. Tomislav became the first king by 925, elevating Croatia to the status of a kingdom. The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir. Croatia entered a personal union with Hungary in 1102. In 1527, faced with Ottoman conquest, the Croatian Parliament elected Ferdinand I of the House of Habsburg to the Croatian throne. In 1918, after World War I, Croatia was included in the unrecognised State of Slovenes, Croats and Serbs which seceded from Austria-Hungary and merged into the Kingdom of Yugoslavia.The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir b"
        profile2.date = "February 2016"
        profile2.profileLikeCount = "8"
        profile2.userProfileImage = UIImage(named: "profileImg")
        profiles.append(profile2)
        
        
        let profile3 = ReviewModel()
        profile3.userName = "Adam Stone"
        profile3.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. They organised the state into two duchies by the 9th century. Tomislav became the first king by 925, elevating Croatia to the status of a kingdom. The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir. Croatia entered a personal union with Hungary in 1102. In 1527, faced with Ottoman conquest, the Croatian Parliament elected Ferdinand I of the House of Habsburg to the Croatian throne. In 1918, after World War I, Croatia was included in the unrecognised State of Slovenes, Croats and Serbs which seceded from Austria-Hungary and merged into the Kingdom of Yugoslavia.The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir c"
        profile3.date = "August 2015"
        profile3.profileLikeCount = "22"
        profile3.userProfileImage = UIImage(named: "profileImg")
        profiles.append(profile3)
        
        let profile4 = ReviewModel()
        profile4.userName = "Adam Stone"
        profile4.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. They organised the state into two duchies by the 9th century. Tomislav became the first king by 925, elevating Croatia to the status of a kingdom. The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir. Croatia entered a personal union with Hungary in 1102. In 1527, faced with Ottoman conquest, the Croatian Parliament elected Ferdinand I of the House of Habsburg to the Croatian throne. In 1918, after World War I, Croatia was included in the unrecognised State of Slovenes, Croats and Serbs which seceded from Austria-Hungary and merged into the Kingdom of Yugoslavia.The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir.The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD.The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. d"
        profile4.date = "January 2016"
        profile4.profileLikeCount = "2"
        profile4.userProfileImage = UIImage(named: "profileImg")
        profiles.append(profile4)

        let profile5 = ReviewModel()
        profile5.userName = "Chris Stone"
        profile5.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. They organised. e"
        profile5.date = "February 2016"
        profile5.profileLikeCount = "6"
        profile5.userProfileImage = UIImage(named: "profileImg")
        profiles.append(profile5)

        let profile6 = ReviewModel()
        profile6.userName = "Alex Stone"
        profile6.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. They organised the state into two duchies by the 9th century. Tomislav became the first king by 925, elevating Croatia to the status of a kingdom. The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir. Croatia entered a personal union with Hungary in 1102. In 1527, faced with Ottoman conquest, the Croatian Parliament elected Ferdinand I of the House of Habsburg to the Croatian throne. In 1918, after World War I, Croatia was included in the unrecognised State of Slovenes, Croats and Serbs which seceded from Austria-Hungary and merged into the Kingdom of Yugoslavia.The Kingdom of Croatia retained its sovereignty for nearly two centuries, reaching its peak during the rule of Kings Peter Krešimir IV and Dmitar Zvonimir f"
        profile6.date = "March 2016"
        profile6.profileLikeCount = "12"
        profile6.userProfileImage = UIImage(named: "profileImg")
        profiles.append(profile6)

        let profile7 = ReviewModel()
        profile7.userName = "Adam Stn"
        profile7.userReview = "The Croats arrived in the area of present-day Croatia during the early part of the 7th century AD. They organised the state into two duchies by the 9th century. Tomislav became the first king by 925, elevating Croatia to the status of a kingdom. g"
        profile7.date = "April 2016"
        profile7.profileLikeCount = "6"
        profile7.userProfileImage = UIImage(named: "profileImg")
        profiles.append(profile7)
        
        
        return profiles
        
    }

}
