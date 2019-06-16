//
//  IntroViewController.swift
//  NewsApp
//
//  Created by abedalkareem omreyh on 11/4/18.
//  Copyright © 2018 abedalkareem. All rights reserved.
//

import UIKit
import AVKit

class IntroViewController: BaseViewController {
  

  // MARK: - IBOutlets

  @IBOutlet weak var videoView: UIView!
  @IBOutlet weak var aboutLabel: AMLabel!

  // MARK: - Properties

  private var player: AVPlayer!
  weak var delegate: IntroViewControllerDelegate?
  
  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    addBackgroundVideo()
    hideAllViews()
    
    aboutLabel.setTextWithTypeAnimation(typedText: "intro_about_text".localiz(), characterDelay:  10)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showAllViews()
  }
  
  private func addBackgroundVideo() {
    let videoURL = Bundle.main.url(forResource: "intro_video", withExtension: "mp4")
    let playerItem = AVPlayerItem(url: videoURL!)
    NotificationCenter.default.addObserver(self, selector: #selector(didFinishPlaying(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    player = AVPlayer(playerItem: playerItem)
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = view.frame
    playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
    videoView.layer.addSublayer(playerLayer)
    
    player.play()
  }
  
  @objc private func didFinishPlaying(notification: Notification) {
    player.seek(to: CMTime.zero)
    player.play()
  }
  
  // MARK: - Properties
  
  
  @IBAction func letsGo(_ sender: Any) {
    delegate?.nextViewController(destination: .main)
  }
  
  @IBAction func register(_ sender: Any) {
    delegate?.nextViewController(destination: .register)
  }
  
}


protocol IntroViewControllerDelegate: AnyObject {
  func nextViewController(destination: Destination)
}
