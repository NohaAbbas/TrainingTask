//
//  SceneDelegate.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/24/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var customNavBar: CustomNavigationBar?
    var navController: UINavigationController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let module = ApplicationFlow.createTabBarController()
        
        navController = window?.rootViewController as? UINavigationController
        navController?.viewControllers = [module]
        
        if let navController {
            addCustomNavbar(with: navController)
        }
        
        customNavBar?.navBarDelegate = self
        navController?.delegate = self
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    private func addCustomNavbar(with navigationController: UINavigationController) {
        customNavBar = CustomNavigationBar(frame: CGRect(x: 0, y: (navigationController.navigationBar.frame.height) + 20, width: UIScreen.main.bounds.width, height: 40))
        

        if let customNavBar {
            customNavBar.translatesAutoresizingMaskIntoConstraints = false
            navigationController.view.addSubview(customNavBar)
            
            NSLayoutConstraint.activate([
                customNavBar.leadingAnchor.constraint(equalTo: navigationController.view!.leadingAnchor),
                customNavBar.trailingAnchor.constraint(equalTo: navigationController.view!.trailingAnchor),
                customNavBar.topAnchor.constraint(equalTo: navigationController.view!.topAnchor),
                customNavBar.heightAnchor.constraint(equalToConstant: 100)
                  ])

        }
    }

}

extension SceneDelegate : UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        switch viewController {
        case viewController as? UITabBarController:
            customNavBar?.backFromNavigation()
        default:
            customNavBar?.navigate()
        }
    }
}

extension SceneDelegate: CustomNavBarDelegate {
    func didClickBack() {
        customNavBar?.backFromNavigation()
        navController?.popViewController(animated: true)
    }
}
