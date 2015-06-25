//
//  CellNode.swift
//  Sample
//
//  Created by WangSam on 6/25/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

import Foundation

class CellNode: ASCellNode {
  private var _contentNode                    : ASTextNode
  private var _bottomImageNode                : ASImageNode
  static let BodyTextAttributes               = [
    NSForegroundColorAttributeName: UIColor.blackColor(),
    NSFontAttributeName: UIFont.systemFontOfSize(14)
  ]
  
  override init() {
    self._contentNode = ASTextNode()
    let attributeString = NSAttributedString(string: "Another employee at the upstate New York prison where two inmates escaped earlier this month has been arrested, officials said Wednesday. Gene Palmer, a guard at the Clinton County Correctional Facility in Dannemora, was held on $50,000 bond or $25,000 cash bail on charges of promoting prison contraband in the first degree (a class D felony), two counts of tampering with physical evidence (a class E felony) and one count of official misconduct (a class A misdemeanor). The charges carry prison terms ranging from 15 months to seven years.", attributes: CellNode.BodyTextAttributes)
    self._contentNode.attributedString = attributeString
    self._bottomImageNode = ASImageNode()
    self._bottomImageNode.backgroundColor = UIColor.clearColor()
    self._bottomImageNode.image = UIImage(named: "ios_feed_bg_bottom")
    super.init()
    
    self.addSubnode(self._contentNode)
    //self.addSubnode(self._bottomImageNode)
  }
  
  //MARK: Size calculation
  override func calculateSizeThatFits(constrainedSize: CGSize) -> CGSize {
    let bodySize = self._contentNode.measure(CGSizeMake(constrainedSize.width,
      constrainedSize.height))
    // ensure there's room for the text
    var requiredHeight = bodySize.height
    return CGSizeMake(constrainedSize.width, requiredHeight + self._bottomImageNode.image.size.height)
  }
  
  override func layout() {
    var yOffset: CGFloat = 0
    let bodySize = self._contentNode.calculatedSize
    yOffset += bodySize.height
    self._contentNode.frame = CGRectMake(0, 0, bodySize.width, bodySize.height)
    self._bottomImageNode.frame = CGRectMake(0, yOffset
      , self._bottomImageNode.image.size.width, self._bottomImageNode.image.size.height)
  }
}