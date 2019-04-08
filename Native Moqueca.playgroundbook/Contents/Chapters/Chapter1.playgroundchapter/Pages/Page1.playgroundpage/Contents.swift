//#-hidden-code
import UIKit
import PlaygroundSupport
import AVFoundation
class MyViewController : UIViewController, AVAudioPlayerDelegate {
    
    var label = UILabel()
    var button : UIButton!
    var numberOfScreen:Int = 0
    var vectorText:[String]=["Hello! I’m Naiá, a native Brazilian. I live in a small native south american tribe located in the  Amazon. On Sundays, my husband Jaci and I eat a native dish called ''Moqueca de Peixe''. I want to teach you more about my culture and how to prepare this dish for your family...It’s tasty! Shall we? I almost forgot… If in your country there aren’t any of theese ingredients, you can replace them.\nTouch my face to see the first ingredient.The next ones will show up as you touch them.", "\n\nWash a 1kg sea bass in running water.", "\n\nSeason with a pinch of salt.", "\n\nSeason with a pinch of black pepper.","\n\nSqueeze a lemon.", "\n\nDice 3 tomatos and mix with the fish.","\n\nDice a red bell pepper and mix with the fish and tomatos.", "\n\nDice a green bell pepper and mix with the fish,\ntomatos and red bell pepper." ,"\n\nDice a yellow bell pepper and mix with the fish,\ntomatos, red bell pepper and green bell pepper.", "\n\nAdd palm oil to the mix.", "\n\nAdd coconut milk to the mix.", "\n\nArrange in layers, alternating the aromatics with\nthe fish. Bring to a high heat until it boils.","\n\nLower the heat, cover the pan and cook it\n until the fish is soft to the touch of the fork.\nIT'S READY!!!"]
    
    var vectorImages:[String]=["india 2","peixe","sal","pimenta","limao","tomate","pimentao_vermelho","pimentao_verde", "pimentao_amarelo", "oleo de dende", "leitedecoco", "Ativo 2", "moqueca"]
    var backgroundSound: AVAudioPlayer?
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9101707339, green: 0.8730688691, blue: 0.7593228221, alpha: 1)
        self.view = view
        label.font = UIFont(name: "TimesBold", size: 17.5)
        label.frame = CGRect(x:10.0, y:40.0, width: 500, height: 200)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
        button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(all), for: .touchUpInside)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
        
        organizeScreen(numScreen: 0)
        
        loopMusic()
    }
    
    func loopMusic() {
        backgroundSound?.delegate = self
        let path = Bundle.main.path(forResource: "audio.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do{
            backgroundSound = try AVAudioPlayer(contentsOf: url)
            backgroundSound?.play()
            backgroundSound?.numberOfLoops = 1000000000
        }catch{
            print("Problem with audio")
        }
    }

    func organizeScreen (numScreen:Int){
        label.text = vectorText[numScreen]
        button.setImage(UIImage(named: vectorImages[numScreen]), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100
            ).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        label.preferredMaxLayoutWidth = 370
    }
    
    
    @objc func all() {
        if numberOfScreen == 12{
            numberOfScreen = 0
            organizeScreen(numScreen: numberOfScreen)
            
        }
        else{
        numberOfScreen+=1
        organizeScreen(numScreen: numberOfScreen)
        }
    }
}


PlaygroundPage.current.liveView = MyViewController()

//#-end-hidden-code
//:![capa](Moqueca_de_peixe.jpg)
//: "Hi there, my name is Cassia. I wanted to create a Playgorund which tell you about native Brazilian culture. The image above is the "Moqueca de Peixe", a delicious native Brazilian dish. Execute my code and follow what the native says... Enjoy yourselves.  "
