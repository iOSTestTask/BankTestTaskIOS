//
//  RouterImp.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/20/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

// MARK: - RouterImp
final class RouterImp: NSObject {

    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]

    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
        super.init()
        self.rootController?.delegate = self
    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completions.removeValue(forKey: controller)
        completion()
    }
}

// MARK: - Presentable
extension RouterImp: Presentable {

    func toPresent() -> UIViewController {
        return rootController!
    }
}

// MARK: - Router
extension RouterImp: Router {

    func set(isNavigationBarHidden: Bool) {
        rootController?.isNavigationBarHidden = isNavigationBarHidden
    }

    func set(tintColor: UIColor) {
        rootController?.navigationBar.tintColor = tintColor
    }

    func present(_ module: Presentable?) {
        present(module, animated: true, completion: nil)
    }

    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard let controller = module?.toPresent() else { return }

        if let completion = completion {
            completions[controller] = completion
        }

        controller.modalPresentationStyle = .fullScreen
        rootController?.present(controller, animated: animated, completion: nil)
    }

    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        guard let controller = rootController?.presentedViewController else {
            completion?()
            return
        }

        rootController?.dismiss(animated: animated, completion: completion)
        runCompletion(for: controller)
    }

    func push(_ module: Presentable?) {
        push(module, animated: true)
    }

    func push(_ module: Presentable?, hideBottomBar: Bool) {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }

    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }

    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }

    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }

        if let completion = completion {
            completions[controller] = completion
        }

        controller.hidesBottomBarWhenPushed = hideBottomBar
        rootController?.pushViewController(controller, animated: animated)
    }

    func popModule() {
        popModule(animated: true)
    }

    func popModule(animated: Bool) {
        guard let controller = rootController?.popViewController(animated: animated) else {
            return
        }
        runCompletion(for: controller)
    }

    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false, animated: true)
    }

    func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        dismissModule(animated: false) { [weak self] in
            self?.rootController?.setViewControllers([controller], animated: animated)
            self?.rootController?.isNavigationBarHidden = hideBar
        }
    }

    func popToRootModule(animated: Bool) {
        guard let controllers = rootController?.popToRootViewController(animated: animated) else {
            return
        }
        controllers.forEach { controller in
            runCompletion(for: controller)
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension RouterImp: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
            return
        }
        runCompletion(for: poppedViewController)
    }
}
