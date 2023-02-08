//
//  UnityManager.swift
//  simulation
//
//  Created by 이다민 on 2022/11/02.
//

import Foundation
import UnityFramework


struct UnityMessage {
    let gameObjectName: String
    let functionName: String
    let message: String
}


class UnityManager: NSObject {
    
    static let shared = UnityManager()
    
    private let dataBundleId: String = "com.unity3d.framework"
    private let frameworkPath: String = "/Frameworks/UnityFramework.framework"
    
    private var ufw: UnityFramework?
    
    private var hostMainWindow : UIWindow?

    func setHostMainWindow(_ hostMainWindow: UIWindow?) {
        self.hostMainWindow = hostMainWindow
    }
    
//    private init() {}

    func launchUnity() {
        let isInitialized = self.ufw?.appController() != nil
        if isInitialized {
            self.ufw?.showUnityWindow()
        } else {
            guard let ufw = self.loadUnityFramework() else { return }
            self.ufw = ufw
            ufw.setDataBundleId(dataBundleId)
            ufw.register(self)
            ufw.runEmbedded(
                withArgc: CommandLine.argc,
                argv: CommandLine.unsafeArgv,
                appLaunchOpts: nil
            )
        }
    }
    
    func closeUnity() {
        self.ufw?.unloadApplication()
    }
    
    private func loadUnityFramework() -> UnityFramework? {
        let bundlePath: String = Bundle.main.bundlePath + frameworkPath

        let bundle = Bundle(path: bundlePath)
        if bundle?.isLoaded == false {
            bundle?.load()
        }

        let ufw = bundle?.principalClass?.getInstance()
        if ufw?.appController() == nil {
            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
            machineHeader.pointee = _mh_execute_header

            ufw?.setExecuteHeader(machineHeader)
        }
        return ufw
    }
    
    func sendMessageToUnity(_ message: UnityMessage) {
        self.ufw?.sendMessageToGO(withName: message.gameObjectName,
                                  functionName: message.functionName,
                                  message: message.message)
    }
}

extension UnityManager: UnityFrameworkListener {
    
    func unityDidUnload(_ notification: Notification!) {
        self.ufw?.unregisterFrameworkListener(self)
        self.ufw = nil
        self.hostMainWindow?.makeKeyAndVisible()
    }
}
