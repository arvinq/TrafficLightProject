//
//  ViewController.swift
//  TrafficLightProject
//
//  Created by Arvin Quiliza on 6/20/18.
//  Copyright © 2018 arvnq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /**
     Outlet Declarations
     */
    //MARK:- IBOutlets
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var warningButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var trafficLightDesc: UILabel!
    
    /**
     constants for each of the traffic light description.
     */
    //MARK:- Any Variables and Constants
    let goTrafficDesc = "Green traffic light means you can GO straight ahead. Proceed through intersection carefully. Green changes to Amber to send a warning that your lane is about to stop."
    let warningTrafficDesc = "Amber (Yellow) traffic light means a WARNING to STOP. You should stop if it is possible to do so. However, you can proceed through the intersection if you're so close that sudden brake might cause a crash. Amber changes to Red for a full stop."
    let stopTrafficDesc = "Red traffic light means STOP. Wait behind the stop line and do not go through the intersection. Red changes to Green to allow your lane to proceed after stopping."
    
    //MARK:- App lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStartingValue()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
     The idea for each of the IBActions is whenever a traffic light is pressed,
     the next traffic light in "sequence" is enabled and is being set with a dimmer shade of its color.
     The pressed traffic light is being set with a brighter shade of image.
     And the other traffic light, based on sequence, is disabled because user is not allowed to transition to it.
     Finally, the traffic light's description is set calling the setTrafficDescription() method.
     */
    
    //MARK:- IBActions
    /**
     This function is called when the Stop/Red button is pressed.
     - Green traffic light is enabled since it's the next in sequence
     - Amber traffic light is disabled
     */
    @IBAction func stopButtonPressed(_ sender: Any) {
        warningButton.isEnabled = false
        goButton.isEnabled = true
        goButton.setImage(#imageLiteral(resourceName: "greenTransition"), for: .normal)
        stopButton.setImage(#imageLiteral(resourceName: "redStop"), for: .normal)
        
        setTrafficDescription(passing: stopTrafficDesc)
    }
    
    /**
     This function is called when the Warning/Yellow button is pressed
     - Red traffic light is enabled since it's the next in sequence
     - Green traffic light is disabled
     */
    @IBAction func warningButtonPressed(_ sender: Any) {
        stopButton.isEnabled = true
        stopButton.setImage(#imageLiteral(resourceName: "redTransition"), for: .normal)
        goButton.isEnabled = false
        warningButton.setImage(#imageLiteral(resourceName: "yellowWarning"), for: .normal)
        
        setTrafficDescription(passing: warningTrafficDesc)
    }

    /**
     This function is called when the Go/Green button is pressed
     - Amber traffic light is enabled since it's the next in sequence
     - Red traffic light is disabled
     */
    @IBAction func goButtonPressed(_ sender: Any) {
        warningButton.isEnabled = true
        warningButton.setImage(#imageLiteral(resourceName: "yellowTransition"), for: .normal)
        stopButton.isEnabled = false
        goButton.setImage(#imageLiteral(resourceName: "greenGo"), for: .normal)
        
        setTrafficDescription(passing: goTrafficDesc)
    }
    
    /**
     This function is called when the Home button is pressed.
     This allows the app the return to its initial state.
     */
    @IBAction func homeButtonPressed(_ sender: Any) {
        setStartingValue()
    }
    
    //MARK:- Helper Methods
    /**
     This function sets the traffic description based on the selected traffic light color.
     - Parameter desc: The description being passed to be outputted by the traffic light description
     */
    func setTrafficDescription(passing desc: String) {
        trafficLightDesc.text = desc
    }
    
    /**
     This function sets the initial value of the buttons making them enabled for the user to press.
     This also sets the text on the label to set the initial text upon loading the app
     */
    func setStartingValue() {
        
        stopButton.isEnabled = true
        stopButton.setImage(#imageLiteral(resourceName: "redStop"), for: .normal)
        
        warningButton.isEnabled = true
        warningButton.setImage(#imageLiteral(resourceName: "yellowWarning"), for: .normal)
        
        goButton.isEnabled = true
        goButton.setImage(#imageLiteral(resourceName: "greenGo"), for: .normal)
        
        trafficLightDesc.text = "Traffic Light Project\nPlease select any traffic light above to start"
        trafficLightDesc.textAlignment = .center
    }
}

