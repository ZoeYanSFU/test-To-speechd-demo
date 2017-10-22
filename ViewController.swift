//
//  ViewController.swift
//  TextToSpeech Demo
//
//  Created by Frezy Stone Mboumba on 6/30/16.
//  Copyright © 2016 Frezy Stone Mboumba. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var textView: UITextView!
    
    var synthesizer = AVSpeechSynthesizer()
    var totalUtterance: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = "Cuando madruga para ir a la escuela, Basilio está contento y se viste feliz con el uniforme de su colegio. A Basilio no le importa caminar todos los kilómetros que separan su humilde casa de la escuela, ya que hace el camino pensando en su futuro y olvidando su presente. De esta forma, cruza los caminos silbando y saltando entre los pedregales, solo, pero acompañado de su esperanza y la de su madre que suele vigilar la primera parte del agreste recorrido."
        
    }

   
    @IBAction func play(sender: AnyObject) {
        if !self.synthesizer.speaking{
            
            let textParagraphs = self.textView.text.componentsSeparatedByString("\n")
            self.totalUtterance = textParagraphs.count
            
            for pieceOfText in textParagraphs {
                
                let speechUtterance = AVSpeechUtterance(string: pieceOfText)
                let voice = AVSpeechSynthesisVoice(language: "es-MX")
                speechUtterance.voice = voice
                let voices = AVSpeechSynthesisVoice.speechVoices()
                print(voices)
                self.synthesizer.speakUtterance(speechUtterance)
                
            }
            
        }else {
            self.synthesizer.continueSpeaking()
        }
        
        
    }
    
    
    
    
    @IBAction func pause(sender: AnyObject) {
    self.synthesizer.pauseSpeakingAtBoundary(.Word)
    }
    
    @IBAction func stop(sender: AnyObject) {
   self.synthesizer.stopSpeakingAtBoundary(.Immediate)
    }
    
    
    
    
    
    
    
    
    

}

