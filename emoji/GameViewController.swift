import UIKit
import SpriteKit
import ARKit

class GameViewController: UIViewController, ARSKViewDelegate {
    
    var sceneView:ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView = self.view as! ARSKView
        
        sceneView.delegate = self
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        if let scene = SKScene(fileNamed: "GameScene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        let spriteNode = SKSpriteNode(imageNamed: "art.scnassets/sword.png")
        spriteNode.xScale = 0.25
        spriteNode.yScale = 0.25
        
        let returnNode = SKSpriteNode()
        returnNode.addChild(spriteNode)
        return returnNode;
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {}
    func sessionWasInterrupted(_ session: ARSession) {}
    func sessionInterruptionEnded(_ session: ARSession) {}
}

