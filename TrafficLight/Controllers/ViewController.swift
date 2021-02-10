//
//  ViewController.swift
//  TrafficLight
//
//  Created by Beau Nouvelle on 10/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stopLightView: UIView!
    @IBOutlet weak var orangeLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var lightState: LightState = .stop {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopLightView.layer.cornerRadius = 65
        stopLightView.layer.borderWidth = 4
        stopLightView.layer.borderColor = UIColor.black.cgColor
        
        orangeLightView.layer.cornerRadius = 65
        orangeLightView.layer.borderWidth = 4
        orangeLightView.layer.borderColor = UIColor.black.cgColor

        greenLightView.layer.cornerRadius = 65
        greenLightView.layer.borderWidth = 4
        greenLightView.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reset()
        lightState = .stop
    }
    
    func reset() {
        stopLightView.backgroundColor = .clear
        orangeLightView.backgroundColor = .clear
        greenLightView.backgroundColor = .clear
    }

    func updateView() {
        reset()
        descriptionLabel.text = lightState.description
        
        switch lightState {
        case .stop:
            stopLightView.backgroundColor = .systemRed
        case .floorIt:
            orangeLightView.backgroundColor = .systemOrange
        case .go:
            greenLightView.backgroundColor = .systemGreen
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        switch lightState {
        case .stop:
            lightState = .go
        case .floorIt:
            lightState = .stop
        case .go:
            lightState = .floorIt
        }
    }
    
}

enum LightState {
    case stop
    case floorIt
    case go
    
    var description: String {
        switch self {
        case .stop:
            return "Eveyone's least favourite traffic light - Red!\n\nThis means you must stop until the light turns green again."
        case .floorIt:
            return "Amber is the tricky light.\n\nIt signals the approach of red, and means you must slow down to a stop if it is safe to do so."
        case .go:
            return "Definitely everyone's favourite traffic light.\n\nGreen means it is now safe to drive!"
        }
    }
}
