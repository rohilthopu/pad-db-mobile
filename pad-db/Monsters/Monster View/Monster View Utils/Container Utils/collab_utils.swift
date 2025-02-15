//
//  SetupCollabUtils.swift
//  pad-db
//
//  Created by Rohil Thopu on 9/2/19.
//  Copyright © 2019 Rohil Thopu. All rights reserved.
//

import Foundation
import UIKit

extension MonsterView {
    func setupCollabContainer() {
        // setup the main container constraints first
        scrollView.addSubview(seriesContainer)
        seriesContainer.setLeftAnchor(to: .leading, of: self.view, withSpacing: 0)
        seriesContainer.setRightAnchor(to: self.view, withSpacing: 0)
        seriesContainer.setTopAnchor(to: .bottom, of: saleCoinContainer, withSpacing: verticalAnchorSpacing)
        seriesContainer.setBottomAnchor(to: .bottom, of: scrollView, withSpacing: verticalAnchorSpacing)
        
        
        let header = makeLabel(ofSize: 20, withText: "Series")
        let separator = makeSeparator()
        let seriesLabel = makeLabel(ofSize: 16)
        
        
        let imgSize = CGFloat(60)
        
        seriesContainer.addSubview(header)
        seriesContainer.addSubview(separator)
        seriesContainer.addSubview(seriesLabel)
        
        header.setCenterXAnchor(to: seriesContainer)
        header.setTopAnchor(to: .top, of: seriesContainer, withSpacing: 0)
        
        
        if monster.collabID == 0 && monster.seriesID == 0 {
            seriesLabel.text = monster.name + " is not part of any series"
            seriesLabel.lineBreakMode = .byWordWrapping
            seriesLabel.numberOfLines = 0
            
            seriesLabel.setBottomAnchor(to: .top, of: separator, withSpacing: verticalAnchorSpacing)
        }  else {
            var seriesMonsters = [UIImageView]()
            
            
            if monster.seriesID != 0 {
                seriesLabel.text = monster.series
                seriesMonsters = getMonstersFromSeries(usingSeriesID: monster.seriesID).map{
                    return makeImgView(forImg: getPortraitURL(id: $0.cardID), ofSize: imgSize)
                }
                
            } else {
                seriesLabel.text = monster.collab
                seriesMonsters = getMonstersFromCollab(usingCollabID: monster.collabID).map{
                    return makeImgView(forImg: getPortraitURL(id: $0.cardID), ofSize: imgSize)
                }
            }
            
            
            let imageContainers = makeHorizontalImageRows(forMonsters: seriesMonsters)
            let otherCollabMonstersContainer = makeLargeContainer(forImageRows: imageContainers)
            
            seriesContainer.addSubview(otherCollabMonstersContainer)
            
            otherCollabMonstersContainer.setTopAnchor(to: .bottom, of: seriesLabel, withSpacing: 20)
            otherCollabMonstersContainer.setLeftAnchor(to: .leading, of: seriesContainer)
            otherCollabMonstersContainer.setRightAnchor(to: seriesContainer)
            otherCollabMonstersContainer.setBottomAnchor(to: .top, of: separator, withSpacing: verticalAnchorSpacing)
            
        }
        
        seriesLabel.setTopAnchor(to: .bottom, of: header, withSpacing: verticalAnchorSpacing)
        seriesLabel.setCenterXAnchor(to: seriesContainer)
        
        
        separator.setCenterXAnchor(to: seriesContainer)
        separator.setBottomAnchor(to: .bottom, of: seriesContainer, withSpacing: 0)
        
    }
    
    private func getMonstersFromCollab(usingCollabID collab_id:Int) -> [MonsterListItem] {
        if collab_id == 0 {
            return []
        }
        return goodMonsters.filter{
            $0.collabID == collab_id
        }
    }
    
    private func getMonstersFromSeries(usingSeriesID seriesID:Int) -> [MonsterListItem]{
        if seriesID == 0 {
            return []
        }
        return goodMonsters.filter{
            $0.seriesID == seriesID
        }
    }
    
    func makeHorizontalImageRows(forMonsters monsters: [UIImageView]) -> [UIView] {
        var imageContainers = [UIView]()
        
        var currentImgCount = 0
        var currIndex = 0
        // a horizontal image container
        var horizontalImageRow = makeView()
        var prevImage = monsters[0]
        while (currIndex < monsters.count) {
            let currentImage = monsters[currIndex]
            horizontalImageRow.addSubview(currentImage)
            currentImage.setTopAnchor(to: .top, of: horizontalImageRow)
            currentImage.setBottomAnchor(to: .bottom, of: horizontalImageRow)
            if currentImgCount == 0 {
                currentImage.setLeftAnchor(to: .leading, of: horizontalImageRow)
            } else {
                // we are on the first image?
                currentImage.setLeftAnchor(to: .trailing, of: prevImage, withSpacing: 10)
            }
            // store the previous image
            prevImage = currentImage
            currentImgCount += 1
            currIndex += 1
            
            if currentImgCount == 5 || currIndex == monsters.count {
                currentImgCount = 0
                imageContainers.append(horizontalImageRow)
                currentImage.setRightAnchor(to: horizontalImageRow)
                
                horizontalImageRow = makeView()
            }
        }
        return imageContainers
    }
    
    func makeLargeContainer(forImageRows imageContainers: [UIView]) -> UIView {
        let otherMonstersContainer = makeView()
        
        var currIndex = 0
        var prevContainer = imageContainers[0]
        while (currIndex < imageContainers.count) {
            let currentContainer = imageContainers[currIndex]
            otherMonstersContainer.addSubview(currentContainer)
            currentContainer.setCenterXAnchor(to: otherMonstersContainer)
            
            
            if currIndex == 0 {
                // set the main anchors
                currentContainer.setTopAnchor(to: .top, of: otherMonstersContainer)
                
            } else {
                currentContainer.setTopAnchor(to: .bottom, of: prevContainer, withSpacing: 10)
            }
            
            currIndex += 1
            prevContainer = currentContainer
            
            if currIndex == imageContainers.count {
                currentContainer.setBottomAnchor(to: .bottom, of: otherMonstersContainer)
            }
        }
        return otherMonstersContainer
    }
}
